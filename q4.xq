let $q4 :=

for $posting in doc("posting.xml")//posting
        (:let $reqSkill := $posting//@what:)
        for $reqSkill in $posting//@what
        for $givenSkill in doc("resume.xml")//*/skills

        (:let $pLevel := $reqSkill/..//@level
                let $rLevel := $givenSkill//@level:)

        where $reqSkill=$givenSkill/*/@what and $reqSkill/..//@level > $givenSkill//@level

        (:$posting/*[@level >= $givenSkill/@level]
                let $pLevel := $posting//@level
                let $rLevel := $givenSkill//@level:)
        return $posting//@pID 

return fn:distinct-values($q4)
