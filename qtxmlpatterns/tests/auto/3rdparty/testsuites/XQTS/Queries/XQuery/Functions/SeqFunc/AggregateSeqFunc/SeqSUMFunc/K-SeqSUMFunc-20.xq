(:*******************************************************:)
(: Test: K-SeqSUMFunc-20                                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:23+01:00                       :)
(: Purpose: A test whose essence is: `sum((xs:float(1), 2, xs:untypedAtomic("3"))) eq 6`. :)
(:*******************************************************:)
sum((xs:float(1), 2, xs:untypedAtomic("3"))) eq 6