(:*******************************************************:)
(: Test: K2-SeqExprCast-451                              :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Cast xs:time("11:11:11++1:11"), which is an invalid lexical representation. :)
(:*******************************************************:)
xs:time("11:11:11++1:11")