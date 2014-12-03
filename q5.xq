let $partA :=
let $totalRes :=fn:count(doc("resume.xml")//resume)
let $tr := number($totalRes)
for $posting in doc("posting.xml")//posting
        for $reqSkill in $posting//@what
        let $numThatHaveSkill := fn:count(doc("resume.xml")//resume//skill[@what = $reqSkill])
        let $nths :=number($numThatHaveSkill)

        return
                if ($nths div $tr < 0.5)
                then $posting//@pID
                else()


let $partB :=


let $totalRes :=fn:count(doc("resume.xml")//resume)
let $tr := number($totalRes)
for $posting in doc("posting.xml")//posting
        for $reqSkill in $posting//@what

        let $aboveLevel := fn:count(doc("resume.xml")//resume//skill[@what = $reqSkill and @level >2])
        let $nal := number($aboveLevel)

        return
                if ($nal div $tr <0.5)
                then $posting//@pID
                else()

let $distinct := distinct-values(data($partA), data($partB))

return ($partA, $partB)
