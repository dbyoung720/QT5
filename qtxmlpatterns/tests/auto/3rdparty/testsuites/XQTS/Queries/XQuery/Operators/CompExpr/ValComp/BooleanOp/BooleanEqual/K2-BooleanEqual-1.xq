(:*******************************************************:)
(: Test: K2-BooleanEqual-1                               :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Cannot compare xs:boolean and xs:untypedAtomic. :)
(:*******************************************************:)
xs:untypedAtomic("true") eq true()