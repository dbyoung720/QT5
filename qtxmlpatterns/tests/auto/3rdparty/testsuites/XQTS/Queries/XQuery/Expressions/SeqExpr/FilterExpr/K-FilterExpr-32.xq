(:*******************************************************:)
(: Test: K-FilterExpr-32                                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:20+01:00                       :)
(: Purpose: A test whose essence is: `deep-equal((1, 2, 3), (1, 2, 3)[. instance of xs:integer])`. :)
(:*******************************************************:)
deep-equal((1, 2, 3), (1, 2, 3)[. instance of xs:integer])