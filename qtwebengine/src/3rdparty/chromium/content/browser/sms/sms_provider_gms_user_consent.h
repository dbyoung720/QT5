// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CONTENT_BROWSER_SMS_SMS_PROVIDER_GMS_USER_CONSENT_H_
#define CONTENT_BROWSER_SMS_SMS_PROVIDER_GMS_USER_CONSENT_H_

#include <utility>

#include "base/android/jni_string.h"
#include "base/android/scoped_java_ref.h"
#include "base/macros.h"
#include "content/browser/sms/sms_provider.h"
#include "content/common/content_export.h"

namespace content {

class CONTENT_EXPORT SmsProviderGmsUserConsent : public SmsProvider {
 public:
  SmsProviderGmsUserConsent(base::WeakPtr<RenderFrameHost> rfh);
  ~SmsProviderGmsUserConsent() override;

  void Retrieve() override;

  void OnReceive(JNIEnv*, jstring message);

  void OnTimeout(JNIEnv* env);

  base::android::ScopedJavaGlobalRef<jobject> GetSmsReceiverForTesting() const;

 private:
  base::android::ScopedJavaGlobalRef<jobject> j_sms_receiver_;
  const base::WeakPtr<RenderFrameHost> render_frame_host_;

  DISALLOW_COPY_AND_ASSIGN(SmsProviderGmsUserConsent);
};

}  // namespace content

#endif  // CONTENT_BROWSER_SMS_SMS_PROVIDER_GMS_USER_CONSENT_H_
