let $resumes:=doc("resume.xml")
let $q4 :=

for $posting in doc("posting.xml")//posting

    for $reqSkill in $posting/reqSkill
    let $what := $reqSkill/@what
    let $reqLvl := $reqSkill/@level
    let $allSkillNodes := $resumes//skill[@what=$what]

    (: "Does there exists a skill node -- for any candidate -- 
        such that their skill level is >= the req skill level?" :)
    return 
        if (empty($allSkillNodes[@level>=$reqLvl]))
        then ($posting//@pID)
        else ()
    

return fn:distinct-values($q4)
