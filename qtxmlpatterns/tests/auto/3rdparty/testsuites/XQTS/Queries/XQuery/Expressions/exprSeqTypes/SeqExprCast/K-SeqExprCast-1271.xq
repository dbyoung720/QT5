(:*******************************************************:)
(: Test: K-SeqExprCast-1271                              :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: 'castable as' involving xs:base64Binary as source type and xs:string as target type should always evaluate to true. :)
(:*******************************************************:)
xs:base64Binary("aaaa") castable as xs:string