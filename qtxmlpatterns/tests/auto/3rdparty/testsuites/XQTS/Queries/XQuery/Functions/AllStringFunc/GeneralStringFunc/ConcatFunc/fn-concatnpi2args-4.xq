(:*******************************************************:)
(:Test: concatnpi2args-4                                  :)
(:Written By: Carmelo Montanez                            :)
(:Date: Wed Dec 15 15:41:48 GMT-05:00 2004                :)
(:Purpose: Evaluates The "concat" function               :)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:nonPositiveInteger(lower bound)             :)
(:$arg2 = xs:nonPositiveInteger(mid range)               :)
(:*******************************************************:)

fn:concat(xs:nonPositiveInteger("-999999999999999999"),xs:nonPositiveInteger("-475688437271870490"))