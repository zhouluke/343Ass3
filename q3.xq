let $level :=

   for $posting in doc("posting.xml")//posting
   let $max:= fn:max($posting//@importance)
	(:return $max:)
   	for $reqs in $posting//@importance
   	where $max=$reqs
	return $reqs/..



return $level   






(:   let $req := $posting//@importance :)
(:  where $req = $max :)
(:   where fn:data($posting//@importance) = fn:max($posting//@importance) :)
(:   return $posting//@what :)
