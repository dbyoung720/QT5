(:*******************************************************:)
(: Test: K-NamespaceURIFromQNameFunc-5                   :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: A test whose essence is: `namespace-uri-from-QName( QName("example.com/", "pre:lname")) instance of xs:anyURI`. :)
(:*******************************************************:)
namespace-uri-from-QName(
			QName("example.com/", "pre:lname")) instance of xs:anyURI