<nav class="menu-button">
  <ul>

    [#-- We check if the variable has content --]
    [#if content.multi?has_content]

      [#-- We obtain the child nodes of type mgnl:contentNode --]
      [#assign childrenNodeType = cmsfn.children(content.multi, "mgnl:contentNode")]

      [#list childrenNodeType as childNode]

        [#-- We obtain the page identifier --]
        [#assign landingPage = cmsfn.contentById(childNode.targetPage)!]

        [#-- If an icon was included, the name is replaced by the icon --]
        [#if childNode.iconLink?has_content]

            [#-- We try to get the logo asset --]
            [#assign assetIcon = damfn.getAsset(childNode.iconLink)!]

            <li class="swing">
                <a href="${cmsfn.link(landingPage)!}">
                    <img class="asset-logo" src="${assetIcon.link}">
                </a>
            </li>

        [#-- Otherwise, you enter the name of the image, and failing that, its title --]
        [#else]

            <li class="transUp">
                <a href="${cmsfn.link(landingPage)!}">
                    ${childNode.reference!landingPage.title!landingPage.@name}
                </a>
            </li>

        [/#if]
      [/#list]
    [/#if]
  </ul>
</nav>