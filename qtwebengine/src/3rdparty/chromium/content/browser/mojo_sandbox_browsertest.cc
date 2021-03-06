// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <stdint.h>
#include <memory>
#include <utility>

#include "base/bind.h"
#include "base/containers/span.h"
#include "base/macros.h"
#include "base/memory/read_only_shared_memory_region.h"
#include "base/memory/shared_memory_mapping.h"
#include "base/memory/unsafe_shared_memory_region.h"
#include "base/memory/writable_shared_memory_region.h"
#include "base/run_loop.h"
#include "base/strings/string_piece.h"
#include "base/task/post_task.h"
#include "base/test/bind_test_util.h"
#include "content/browser/utility_process_host.h"
#include "content/public/browser/browser_task_traits.h"
#include "content/public/browser/browser_thread.h"
#include "content/public/test/content_browser_test.h"
#include "content/public/test/test_service.mojom.h"
#include "mojo/public/cpp/bindings/remote.h"
#include "services/service_manager/public/cpp/interface_provider.h"

namespace content {
namespace {

const std::string kTestMessage = "My hovercraft is full of eels!";

class MojoSandboxTest : public ContentBrowserTest {
 public:
  MojoSandboxTest() = default;

  void SetUpOnMainThread() override {
    base::RunLoop run_loop;
    base::PostTaskAndReply(
        FROM_HERE, {BrowserThread::IO},
        base::BindOnce(&MojoSandboxTest::StartUtilityProcessOnIoThread,
                       base::Unretained(this)),
        run_loop.QuitClosure());
    run_loop.Run();
  }

  void TearDownOnMainThread() override {
    base::RunLoop run_loop;
    base::PostTaskAndReply(
        FROM_HERE, {BrowserThread::IO},
        base::BindOnce(&MojoSandboxTest::StopUtilityProcessOnIoThread,
                       base::Unretained(this)),
        run_loop.QuitClosure());
    run_loop.Run();
  }

 protected:
  std::unique_ptr<UtilityProcessHost> host_;

 private:
  void StartUtilityProcessOnIoThread() {
    host_.reset(new UtilityProcessHost());
    host_->SetMetricsName("mojo_sandbox_test_process");
    ASSERT_TRUE(host_->Start());
  }

  void StopUtilityProcessOnIoThread() { host_.reset(); }

  DISALLOW_COPY_AND_ASSIGN(MojoSandboxTest);
};

// Ensures that a read-only shared memory region can be created within a
// sandboxed process.
IN_PROC_BROWSER_TEST_F(MojoSandboxTest, SubprocessReadOnlySharedMemoryRegion) {
  mojo::Remote<mojom::TestService> test_service;
  base::PostTask(
      FROM_HERE, {BrowserThread::IO},
      base::BindOnce(
          [](UtilityProcessHost* host,
             mojo::PendingReceiver<mojom::TestService> receiver) {
            host->GetChildProcess()->BindReceiver(std::move(receiver));
          },
          host_.get(), test_service.BindNewPipeAndPassReceiver()));

  bool got_response = false;
  base::RunLoop run_loop;
  test_service.set_disconnect_handler(run_loop.QuitClosure());
  test_service->CreateReadOnlySharedMemoryRegion(
      kTestMessage,
      base::BindLambdaForTesting([&](base::ReadOnlySharedMemoryRegion region) {
        got_response = true;
        ASSERT_TRUE(region.IsValid());
        base::ReadOnlySharedMemoryMapping mapping = region.Map();
        ASSERT_TRUE(mapping.IsValid());
        auto span = mapping.GetMemoryAsSpan<const char>();
        EXPECT_EQ(kTestMessage, base::StringPiece(span.data(), span.size()));
        run_loop.Quit();
      }));
  run_loop.Run();
  EXPECT_TRUE(got_response);
}

// Ensures that a writable shared memory region can be created within a
// sandboxed process.
IN_PROC_BROWSER_TEST_F(MojoSandboxTest, SubprocessWritableSharedMemoryRegion) {
  mojo::Remote<mojom::TestService> test_service;
  base::PostTask(
      FROM_HERE, {BrowserThread::IO},
      base::BindOnce(
          [](UtilityProcessHost* host,
             mojo::PendingReceiver<mojom::TestService> receiver) {
            host->GetChildProcess()->BindReceiver(std::move(receiver));
          },
          host_.get(), test_service.BindNewPipeAndPassReceiver()));

  bool got_response = false;
  base::RunLoop run_loop;
  test_service.set_disconnect_handler(run_loop.QuitClosure());
  test_service->CreateWritableSharedMemoryRegion(
      kTestMessage,
      base::BindLambdaForTesting([&](base::WritableSharedMemoryRegion region) {
        got_response = true;
        ASSERT_TRUE(region.IsValid());
        base::WritableSharedMemoryMapping mapping = region.Map();
        ASSERT_TRUE(mapping.IsValid());
        auto span = mapping.GetMemoryAsSpan<const char>();
        EXPECT_EQ(kTestMessage, base::StringPiece(span.data(), span.size()));
        run_loop.Quit();
      }));
  run_loop.Run();
  EXPECT_TRUE(got_response);
}

// Ensures that an unsafe shared memory region can be created within a
// sandboxed process.
IN_PROC_BROWSER_TEST_F(MojoSandboxTest, SubprocessUnsafeSharedMemoryRegion) {
  mojo::Remote<mojom::TestService> test_service;
  base::PostTask(
      FROM_HERE, {BrowserThread::IO},
      base::BindOnce(
          [](UtilityProcessHost* host,
             mojo::PendingReceiver<mojom::TestService> receiver) {
            host->GetChildProcess()->BindReceiver(std::move(receiver));
          },
          host_.get(), test_service.BindNewPipeAndPassReceiver()));

  bool got_response = false;
  base::RunLoop run_loop;
  test_service.set_disconnect_handler(run_loop.QuitClosure());
  test_service->CreateUnsafeSharedMemoryRegion(
      kTestMessage,
      base::BindLambdaForTesting([&](base::UnsafeSharedMemoryRegion region) {
        got_response = true;
        ASSERT_TRUE(region.IsValid());
        base::WritableSharedMemoryMapping mapping = region.Map();
        ASSERT_TRUE(mapping.IsValid());
        auto span = mapping.GetMemoryAsSpan<const char>();
        EXPECT_EQ(kTestMessage, base::StringPiece(span.data(), span.size()));
        run_loop.Quit();
      }));
  run_loop.Run();
  EXPECT_TRUE(got_response);
}

}  //  namespace
}  //  namespace content
