(:*******************************************************:)
(: Test: K-ExpandedQNameConstructFunc-10                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: A test whose essence is: `QName((), "local") eq xs:QName("local")`. :)
(:*******************************************************:)
QName((), "local") eq xs:QName("local")