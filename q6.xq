let $r1 :=

for $posting in doc("posting.xml")//posting
        for $reqSkill in $posting//@what
        for $resume in doc("resume.xml")//resume
        for $haveSkill in $resume//skill[@what = $reqSkill]

        return ($resume//@rID, $haveSkill)


let $r2 :=

for $posting in doc("posting.xml")//posting
        for $reqSkill in $posting//@what
        for $resume in doc("resume.xml")//resume
        for $haveSkill in $resume//skill[@what = $reqSkill]

        return ($resume//@rID, $haveSkill)

let $pairs :=

        for $p1 in $r1, $p2 in $r2

        return ($p1, $p2)
return $pairs
