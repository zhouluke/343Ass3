let $level :=

   for $posting in doc("posting.xml")//posting
   let $max:= fn:max($posting//@importance)
        (:return $max:)
        for $reqs in $posting//@importance
        where $max=$reqs
        return ((:$posting/@pID,:) $reqs/..//@what, $reqs)

return $level

