(:*******************************************************:)
(: Test: K2-SeqExprInstanceOf-92                         :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Ensure that a cast to xs:nonNegativeInteger is of the right type, when casting from xs:float. :)
(:*******************************************************:)
xs:nonNegativeInteger(xs:float("4")) instance of xs:nonNegativeInteger