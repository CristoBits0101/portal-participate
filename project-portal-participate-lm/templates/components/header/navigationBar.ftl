[#-- Import the getPages macro --]
[#include "/project-portal-participate/templates/macros/getPages.ftl"]

[#-- We check if the variable has content and is not null --]
[#if content.page?has_content && content.homeIconLink?has_content]

    [#-- We build the path --]
    [#assign path = "/" + "${content.page}"]

    [#-- We try to store the path of the page --]
    [#assign targetNode = cmsfn.contentByPath("${path}", "website")!]

    [#-- We try to store the logo asset --]
    [#assign assetIcon = damfn.getAsset(content.homeIconLink)!]

[#elseif content.page?has_content]

    [#-- We build the path --]
    [#assign path = "/" + "${content.page}"]

    [#-- We try to store the path of the page --]
    [#assign targetNode = cmsfn.contentByPath("${path}", "website")!]

[/#if]

[#-- We check if the variable has content and is not null --]
[#if targetNode?has_content || assetIcon?has_content]

    [#-- Transfers the content to the portalNavigation macro --]
    [@getPages targetNode assetIcon /]

[/#if]