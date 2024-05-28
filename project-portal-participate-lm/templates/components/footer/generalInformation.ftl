[#-- Title for column --]
<h4>${content.title}</h4>

<ul>

    [#-- We check if the variable has content --]
    [#if content.multi?has_content]

        [#-- We obtain the child nodes of type mgnl:contentNode --]
        [#assign childrenNodeType = cmsfn.children(content.multi, "mgnl:contentNode")]

        [#list childrenNodeType as childNode]

            [#-- We obtain the page identifier --]
            [#assign landingPage = cmsfn.contentById(childNode.targetPage)!]

            <li>

                [#-- We print the link to the identifier --]
                <a href="${cmsfn.link(landingPage)!}" target="_blank">
                    ${childNode.article!landingPage.title!landingPage.@name}
                </a>

            </li>
            
        [/#list]

    [/#if]

</ul>