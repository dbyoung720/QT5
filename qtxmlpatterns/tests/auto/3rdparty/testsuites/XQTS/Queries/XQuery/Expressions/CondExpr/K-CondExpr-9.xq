(:*******************************************************:)
(: Test: K-CondExpr-9                                    :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: An if-test which EBV cannot be extracted from. :)
(:*******************************************************:)
0 eq (if(xs:anyURI("")) then 1 else 0)