[#-- Logo imagen --]
[#assign asset = damfn.getAsset(content.logoLink)!]

[#if asset?has_content]

    <img class="logo-image" src="${asset.link}">

[#-- Warning Message --]
[#elseif cmsfn.editMode]
    <script>
        alert('¡The selected resource was not found!')
    </script>
[/#if]