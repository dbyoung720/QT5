(: name : cast-within-2 :)
(: description : Casting from integer to long.:)

(: insert-start :)
declare variable $input-context1 external;
(: insert-end :)

let $value := xs:integer(10.0)
return $value cast as xs:long