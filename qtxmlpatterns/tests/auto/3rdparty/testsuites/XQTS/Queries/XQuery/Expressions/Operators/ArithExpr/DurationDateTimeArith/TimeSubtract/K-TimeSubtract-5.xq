(:*******************************************************:)
(: Test: K-TimeSubtract-5                                :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: The '+' operator is not available between xs:time and xs:time. :)
(:*******************************************************:)
xs:time("08:01:23") + xs:time("08:01:23")