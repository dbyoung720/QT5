(: Name: casthcds30 :)
(: Description: Simple test for casting an dateTime as a time - XML Data Source :)
(: insert-start :)
import schema namespace atomic="http://www.w3.org/XQueryTest";
declare variable $input-context1 external;
(: insert-end :)


($input-context1/atomic:root/atomic:dateTime) cast as xs:time
