[#-- Social network link --]
<a href="${content.url}" target="_blank">

    [#-- Get the asset --]
    [#assign assetIcon = damfn.getAsset(content.iconLink)!]

    [#-- Networks imagen --]
    <img src="${assetIcon.link}" alt="${content.altText}" title="${content.titleText}" class="list-image rotate-360">

</a>