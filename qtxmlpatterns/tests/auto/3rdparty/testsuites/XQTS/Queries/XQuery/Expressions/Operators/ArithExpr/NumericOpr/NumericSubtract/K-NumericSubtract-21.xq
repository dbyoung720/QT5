(:*******************************************************:)
(: Test: K-NumericSubtract-21                            :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:20+01:00                       :)
(: Purpose: A test whose essence is: `string(xs:float("NaN") - 3) eq "NaN"`. :)
(:*******************************************************:)
string(xs:float("NaN") - 3) eq "NaN"