
let $atLeastOne :=
	let $reqSkill := doc("posting.xml")//posting//@what
	let $haveSkill := doc("resume.xml")//resume//skill[@what=$reqSkill]
	return $haveSkill/../..                  


(: Skill sets in each resume :)
let $r1 := doc("resume.xml")//resume//skill
let $r2 := doc("resume.xml")//resume//skill

for $r1 in $r1, $r2 in $r2
where (($r1/@what = $r2/@what 
and $r1//resume//@rID != $r2//resume//@rID) and 
$r1//skills//@level = $r2//skills//@level)
return ($r1,$r2)

(:  let $s1 := $p1//skills//@what
    let $s2 := $p2//skills//@what

    let $l1 := $p1//skills//@level
    let $l2 := $p2//skills//@level

    let $sameSkill := $s1=$s2
    let $sameLevel := $l1=$l2

    where $sameSkill and $sameLevel
    return $p1//@rID
    $p1//skills//[@what = $p2//skills//@what] :)