let $level :=

   for $posting in doc("posting.xml")//posting
   let $max:= fn:max($posting//@importance)
        (:return $max:)
        for $reqs in $posting//@importance
        where $max=$reqs
        return 
		<posting pID="{$posting/@pID}">
        	<skill importance="{$reqs}">{$reqs/..//@what}</skill>
    	</posting>

return $level

