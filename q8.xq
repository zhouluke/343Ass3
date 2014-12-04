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
		<match>5</match>
		<average>93</average>
	</interview>
	<interview>
		<who rID="" forename="" surname="" />
		<position>lol</position>
		<match>8</match>
		<average>23</average>
	</interview>
</report> :)

(: XQUERY IS STUPID -_-
declare function local:degOfMatch($myResume as node(), $myPosting as node()) 
{
	return <match>
	{
		sum(
			for $reqSkill in $myPosting//reqSkill
			let $what:=data($reqSkill/@what)
			let $lvl:=data($reqSkill/@level)
			let $imp:=data($reqSkill[@what=$what]/@importance)

			let $resumeSkill:=$myResume//skill[@what=$what]
			let $resumeWhat:=data($resumeSkill/@what)
			let $resumeLvl:=data($resumeSkill/@level)

			return 
				if ($lvl<=$resumeLvl)
				then ($imp)
				else (-1*$imp)
		)
	}
};
:)

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
		<who rID="{$rID}" forename="{$myResume//forename}" surname="{$myResume//surname}" />,
		$myPosting/position,

		(: degOfMatch($myResume,$myPosting) :)
	
		<match>
		{
			sum(
				for $reqSkill in $myPosting//reqSkill
				let $what:=data($reqSkill/@what)
				let $lvl:=data($reqSkill/@level)
				let $imp:=data($reqSkill[@what=$what]/@importance)

				let $resumeSkill:=$myResume//skill[@what=$what]
				let $resumeLvl:=data($resumeSkill/@level)

				return 
					if ($lvl<=$resumeLvl)
					then ($imp)
					else (-1*$imp)
			) 
		}
		</match>
		,
		<average>
		{
			avg($i//answer | $i//techProficiency | $i//communication | $i//enthusiasm | $i//collegiality) 
		}
		</average>
	}
	</interview>
}
</report>