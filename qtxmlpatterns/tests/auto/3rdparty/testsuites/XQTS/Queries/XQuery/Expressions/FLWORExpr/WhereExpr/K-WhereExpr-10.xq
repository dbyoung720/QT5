(:*******************************************************:)
(: Test: K-WhereExpr-10                                  :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: A for/where expression combined with fn:boolean and xs:anyURI. :)
(:*******************************************************:)
for $i in (1, 2, current-time())[1] where xs:anyURI("example.com/") return true()