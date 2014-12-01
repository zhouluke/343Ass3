(:<!ELEMENT report (interview*)>
<!ELEMENT interview (who, position, match, average)>
<!ELEMENT who EMPTY>
<!ATTLIST who rID CDATA #REQUIRED
              forename CDATA #REQUIRED
              surname CDATA #REQUIRED>
<!ELEMENT position (#PCDATA)>
<!ELEMENT match (#PCDATA)>
<!ELEMENT average (#PCDATA)>:)

(: NEEDED OUTPUT FORMAT:
<report>
	<interview>
		<who rID="" forename="" surname="" />
		<position>lol</position>
		<match>lol</match>
		<average>93</average>
	</interview>
	<interview>
		<who rID="" forename="" surname="" />
		<position>lol</position>
		<match>lol</match>
		<average>93</average>
	</interview>
</report> :)

<report> 
{
	for $i in doc("interview.xml")//interview

	let $rID:=data($i/@rID)
	let $myResume:=doc("resume.xml")//resume[@rID=$rID]

	let $pID:=data($i/@pID)
	let $myPosting:=doc("posting.xml")//posting[@pID=$pID]

	return 
	<interview>
	{
		(<who rID="{$rID}" forename="{$myResume//forename}" surname="{$myResume//surname}" />,
		$myPosting/position)
	}
	</interview>
}
</report>