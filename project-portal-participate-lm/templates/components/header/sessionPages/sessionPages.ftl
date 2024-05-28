[#-- We check if the variable has content --]
[#if content.multi?has_content]

    [#-- We obtain the child nodes of type mgnl:contentNode --]
    [#assign childrenNodeType = cmsfn.children(content.multi, "mgnl:contentNode")]

    [#list childrenNodeType as childNode]

        [#-- We obtain the page identifier --]
        [#assign landingPage = cmsfn.contentById(childNode.targetPage)!]

        <p class="session-paragraph">
            <a href="${cmsfn.link(landingPage)!}">
                ${childNode.reference!landingPage.title!landingPage.@name}
            </a>
        </p>

    [/#list]

[/#if]