(:*******************************************************:)
(:Test: op-numeric-dividesht2args-2                       :)
(:Written By: Carmelo Montanez                            :)
(:Date: Thu Dec 16 10:48:16 GMT-05:00 2004                :)
(:Purpose: Evaluates The "op:numeric-divide" operator    :)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:short(mid range)                            :)
(:$arg2 = xs:short(lower bound)                          :)
(:*******************************************************:)

fn:round-half-to-even((xs:short("-5324") div xs:short("-32768")),5)