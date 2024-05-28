[#if cmsfn.isEditMode()]

    [#-- Display redirection message for authenticated users --]
    <p class="redirection-authenticated-users">${i18n['redirect.message']}</p>

[#elseif ctx.user.name?lower_case != "anonymous" && ctx.user.name?lower_case != "superuser"]

    [#-- Assign target page based on content URL --]
    [#assign targetPage = cmsfn.contentById(content.url)!]

    [#-- Script to execute when window loads --]
    <script>
        window.onload = () => 
        {
            // Display alert message if provided, then redirect to target page.
            alert('${content.alertMessage!}')
            window.location.href = '${cmsfn.link(targetPage)!}'
        }
    </script>

[/#if]