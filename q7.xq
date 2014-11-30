(:<skills>

        <skill name="C">
                <count level="1" n=2/>
                <count level="2" n=0/>
                <count level="3" n=1/>
                <count level="4" n=0/>
                <count level="5" n=0/>

        <skill name="Lisp">
                <count level="1" n=0/>
                <count level="2" n=0/>
                <count level="3" n=0/>
                <count level="4" n=0/>
                <count level="5" n=0/>

        <skill name="Java">
                <count level="1" n=/>
                <count level="2" n=/>
                <count level="3" n=/>
                <count level="4" n=/>
                <count level="5" n=1/>

        </skills>:)

<skills>
{
              for $posting in doc("posting.xml")//posting
                for $reqSkill in $posting//@what
                return <skill>
                          {attribute name { data($reqSkill)} }
                          {
                             let $s := doc("resume.xml")//resume/skills//*[@what=$reqSkill]
                             let $one := fn:count($s/.[@level=1]/@level)
                                return  <count>
                                                {attribute level {1}}
                                                {attribute n {$one}}
                                        </count>}
                                {
                                    let $s := doc("resume.xml")//resume/skills//*[@what=$reqSkill]
                                    let $two := fn:count($s/.[@level=2]/@level)
                                        return <count>
                                                {attribute level {2}}
                                                {attribute n {$two}}
                                                </count>}
                                        {
                                          let $s := doc("resume.xml")//resume/skills//*[@what=$reqSkill]
                                          let $three := fn:count($s/.[@level=3]/@level)
                                                return <count>
                                                       {attribute level {3}}
                                                       {attribute n {$three}}
                                                       </count>}
                                                {
                                                   let $s := doc("resume.xml")//resume/skills//*[@what=$reqSkill]
                                                   let $four := fn:count($s/.[@level=3]/@level)
                                                       return <count>
                                                              {attribute level {4}}
                                                              {attribute n {$four}}
                                                              </count>}
                                                        {
                                                          let $s := doc("resume.xml")//resume/skills//*[@what=$reqSkill]
                                                          let $five := fn:count($s/.[@level=3]/@level)
                                                               return <count>
                                                                      {attribute level {5}}
                                                                      {attribute n {$five}}
                                                                      </count>}
                                                                                                                                 $



                       </skill>




}
</skills>

                      
