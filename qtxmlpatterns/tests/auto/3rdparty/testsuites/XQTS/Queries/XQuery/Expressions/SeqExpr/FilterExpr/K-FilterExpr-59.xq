(:*******************************************************:)
(: Test: K-FilterExpr-59                                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:20+01:00                       :)
(: Purpose: Predicates in combination with the empty sequence. :)
(:*******************************************************:)
empty(()[count(remove((current-time(), 1), 1)) eq 1])