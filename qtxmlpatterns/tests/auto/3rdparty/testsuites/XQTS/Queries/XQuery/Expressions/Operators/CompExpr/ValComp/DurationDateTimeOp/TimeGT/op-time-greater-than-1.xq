(:*******************************************************:)
(:Test: op-time-greater-than-1                           :)
(:Written By: Carmelo Montanez                           :)
(:Date: June 13, 2005                                    :)
(:Purpose: Evaluates The "time-greater-than" function    :)
(:As per example 1 (for this function)of the F&O specs   :)
(:(gt operator).                                         :)
(:*******************************************************:)

(xs:time("08:00:00+09:00") gt xs:time("17:00:00-06:00"))