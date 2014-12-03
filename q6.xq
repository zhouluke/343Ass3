(: Each resume :)
let $resume1 := fn:doc("resume.xml")//resume
let $resume2 := fn:doc("resume.xml")//resume

let $q6 :=
for $res1 in $resume1
let $res1ID := data($res1/@rID)
let $skills1 := $res1//skill
where (exists($skills1))
return
	for $res2 in $resume2
	let $res2ID := data($res2/@rID)
	let $skills2 := $res2//skill
	where (exists($skills2) and $res1ID < $res2ID and 
	(every $s1 in $skills1/@what satisfies some $s2 in $skills2/@what satisfies
	$s1=$s2) and 
	(every $s2 in $skills2/@what satisfies some $s1 in $skills1/@what satisfies
	$s1=$s2))
	return 
	<IDPair>
		<ID>{$res1ID}</ID> 
		<ID>{$res2ID}</ID>
	</IDPair>

return $q6