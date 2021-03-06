(:*******************************************************:)
(: Test: K-SeqExprCast-1407                              :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: 'castable as' involving xs:anyURI as source type and xs:boolean as target type should always evaluate to false. :)
(:*******************************************************:)
not(xs:anyURI("http://www.example.com/an/arbitrary/URI.ext") castable as xs:boolean)