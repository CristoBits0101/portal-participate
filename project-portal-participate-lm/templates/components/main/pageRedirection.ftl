[#-- Page redirection --]
<p>
    [#if content.url?has_content]

        [#-- We obtain the page identifier --]
        [#assign targetPage = cmsfn.contentById(content.url)!]

        [#-- We print the link to the identifier --]
        <a href="${cmsfn.link(targetPage)!}" id="page-redirection">

            [#-- Link message --]
            ${content.linkMessage}
        
        </a>

    [/#if]
</p>