(:*******************************************************:)
(: Test: K-SeqIndexOfFunc-15                             :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: A test whose essence is: `deep-equal((1, 2, 3, 4, 5, 6), index-of((4, 4, 4, 4, 4, 4), 4))`. :)
(:*******************************************************:)
deep-equal((1, 2, 3, 4, 5, 6), index-of((4, 4, 4, 4, 4, 4), 4))