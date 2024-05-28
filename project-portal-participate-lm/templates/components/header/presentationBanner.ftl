[#-- This conditional block checks if the 'assetLink' variable contains content --]
[#if content.imageLink?has_content && content.title?has_content]

    [#-- Banner Container --]
    <div class="banner">

        [#-- Banner title --]
        <h1>${content.title}</h1>

        [#-- Banner imagen --]
        [#assign asset = damfn.getAsset(content.imageLink)!]
        <img class="banner-image" src="${asset.link}">

    </div>

[#elseif content.title?has_content]

    [#-- Banner Container --]
    <div class="banner">

        [#-- Banner title --]
        <h1>${content.title}</h1>

    </div>

[#elseif cmsfn.editMode]

    [#-- Banner Container --]
    <div class="banner">

        [#-- Banner Message --]
        <p>There is no content defined for this banner component.</p>

    </div>

[/#if]