(:*******************************************************:)
(: Test: K-DayTimeDurationAdd-2                          :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Simple test of substraction PT0S with an xs:dayTimeDuration. :)
(:*******************************************************:)
xs:dayTimeDuration("PT0S") + xs:dayTimeDuration("P3DT4H3M3.100S")
			   eq xs:dayTimeDuration("P3DT4H3M3.100S")