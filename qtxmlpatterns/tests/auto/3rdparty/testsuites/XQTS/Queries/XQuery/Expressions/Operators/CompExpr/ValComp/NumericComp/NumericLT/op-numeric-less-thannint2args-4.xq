(:*******************************************************:)
(:Test: op-numeric-less-thannint2args-4                   :)
(:Written By: Carmelo Montanez                            :)
(:Date: Thu Dec 16 10:48:16 GMT-05:00 2004                :)
(:Purpose: Evaluates The "op:numeric-less-than" operator :)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:negativeInteger(lower bound)                :)
(:$arg2 = xs:negativeInteger(mid range)                  :)
(:*******************************************************:)

xs:negativeInteger("-999999999999999999") lt xs:negativeInteger("-297014075999096793")