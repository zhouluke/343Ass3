(:fn:doc("interview.xml"))

(:for $res in doc("resume.xml")//resume
let $num:= fn:count($res//@what)
return $num:)

for $res in doc("resume.xml")//resume   
let $num:= fn:count($res//@what)
where $num >3
return ($res//@rID, $res//forename, $num)

