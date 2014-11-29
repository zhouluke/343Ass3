(:let $noCol := not(doc("interview.xml")//collegiality):)


let $li :=
        for $Iviewer in doc("interview.xml")//assessment
        let $noCol := not($Iviewer//collegiality)
        return
                if ($noCol)
                then $Iviewer/..//@sID
                else()

let $dis := distinct-values($li)
return $dis
