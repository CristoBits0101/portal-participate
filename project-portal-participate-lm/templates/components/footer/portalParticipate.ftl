[#-- Column title --]
<h4>${content.title}</h4>

[#-- Column message --]
${cmsfn.decode(content).message!""}

<p>&nbsp;</p>

<p>
    [#if content.url?has_content]

        [#-- We obtain the page identifier --]
        [#assign targetPage = cmsfn.contentById(content.url)!]

        [#-- We print the link to the identifier --]
        <a href="${cmsfn.link(targetPage)!}" target="_blank">

            [#-- Link message --]
            👉 ${content.linkMessage!"Learn more"}
        
        </a>
        
    [/#if]
</p>

<p>&nbsp;</p>

[#-- Column Companyt text --]
<p>${content.CompanytText}</p>