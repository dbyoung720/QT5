(:*******************************************************:)
(: Test: K-SeqExprCast-801                               :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: 'castable as' involving xs:dateTime as source type and xs:untypedAtomic as target type should always evaluate to true. :)
(:*******************************************************:)
xs:dateTime("2002-10-10T12:00:00-05:00") castable as xs:untypedAtomic