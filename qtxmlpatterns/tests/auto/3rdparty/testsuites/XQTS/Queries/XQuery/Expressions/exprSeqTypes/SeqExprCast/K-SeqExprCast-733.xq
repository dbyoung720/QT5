(:*******************************************************:)
(: Test: K-SeqExprCast-733                               :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: 'castable as' involving xs:yearMonthDuration as source type and xs:base64Binary as target type should always evaluate to false. :)
(:*******************************************************:)
not(xs:yearMonthDuration("P1Y12M") castable as xs:base64Binary)