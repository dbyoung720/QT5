(:*******************************************************:)
(: Test: K-SeqExprCast-659                               :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: 'castable as' involving xs:duration as source type and xs:yearMonthDuration as target type should always evaluate to true. :)
(:*******************************************************:)
xs:duration("P1Y2M3DT10H30M") castable as xs:yearMonthDuration