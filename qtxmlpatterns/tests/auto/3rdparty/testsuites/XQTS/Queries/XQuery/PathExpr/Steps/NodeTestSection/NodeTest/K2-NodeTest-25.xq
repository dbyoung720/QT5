(:*******************************************************:)
(: Test: K2-NodeTest-25                                  :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Use an unbound prefix inside document-node()/schema-element(). :)
(:*******************************************************:)
document-node(schema-element(notBound:ncname))