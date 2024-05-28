[#-- Informational alerts --]
${resfn.cachedJs("/project-portal-participate/webresources/js/notifications/alerts.js")}

[#-- Recent content --]
[#macro getCards targetWorkspace=""]

    [#-- We check if the specified workspace from which to retrieve the content was indicated --]
    [#if targetWorkspace?has_content && targetWorkspace == "news" || targetWorkspace == "products"]

        [#-- We take the reference of the parent node from which we want to iterate over the children --]
        [#assign workspaceNode = cmsfn.contentByPath("/", "${targetWorkspace}")!]

        [#-- We store in a collection all the children with the node type news or products --]
        [#assign childrenNodeType = cmsfn.children(workspaceNode, "${targetWorkspace}")]

        [#-- We reverse the order of the collection to display the news from the latest publication to the oldest --]
        [#assign contentOrderReversed = childrenNodeType?reverse]

        [#-- We check that the user has entered a value for the number of news items they want to see --]
        [#if content.amountContentDisplay?has_content && content.amountContentDisplay > 0]

            [#-- If contentOrderReversed is null, the conditional won't execute, skipping the exception error --]
            [#if contentOrderReversed?? && (contentOrderReversed?size == content.amountContentDisplay) || (contentOrderReversed?size > content.amountContentDisplay) && (contentOrderReversed?size > 0)]

            <script>

                // Positions from which the array is listed.
                // [#assign arrayStarts = ctx.getParameter("previousPage")!0]

                [#assign arrayStarts = 0]
                [#assign arrayEnds = content.amountContentDisplay - 1]
                
                // alert('${arrayStarts}')
                // alert('${arrayEnds}')

            </script>

                [#-- We list the news or products --] 
                [#list contentOrderReversed[arrayStarts?number..(arrayEnds)] as childNode]

                    [#-- Card container --]
                    <article class="card-container">

                        [#-- Card header --]
                        <div class="card-header">

                            [#-- Card imagen --]
                            [#if childNode.imageLink?has_content]

                                [#assign myAsset = damfn.getAsset(childNode.imageLink)]
                                <img src="${myAsset.link}" alt="${childNode.title}" title="${childNode.title}">

                            [#-- Default imagen --]
                            [#else]

                                [#assign myAsset = damfn.getAsset("jcr:874a154f-93a8-4a73-8132-580fbdb87cb1")]
                                <img src="${myAsset.link}" alt="Facebook" title="Facebook" class="list-image">

                            [/#if]

                        </div>

                        [#-- Card body --]
                        <div class="card-body">

                            [#-- Card body head --]
                            <div class="card-body-head">
                                <h3>${cmsfn.wrapForI18n(childNode).title!}</h3>
                                ${cmsfn.wrapForI18n(childNode).message!"<p>The news article does not have a description...</p>"}
                            </div>

                            [#-- Card body body --]
                            <div class="card-body-body">
                                <ul>
                                    <li><span>🎊</span> ${childNode.starts!"Unspecified beginning"}</li>
                                    <li><span>🚧</span> ${childNode.ends!"Unspecified ending"}</li>
                                    <li><span>📍</span> ${cmsfn.wrapForI18n(childNode).location!"Unspecified location"}</li>
                                </ul>
                            </div>
                        </div>

                        [#-- From each news item, we retrieve child nodes of type mgnl:contentNode --]
                        [#assign mgnlContentNodes = cmsfn.children(childNode, "mgnl:contentNode")]

                        [#-- Initialize allContactNodes as an empty list before entering the loop --]
                        [#assign allContacts = []]
                        [#assign allAddresses = []]

                        [#list mgnlContentNodes as mgnlContentNode]

                            [#-- Stores all folders with contact node type --]
                            [#assign contacts = cmsfn.children(mgnlContentNode, "contact")]

                            [#-- Stores all folders with address node type --]
                            [#assign addresses = cmsfn.children(mgnlContentNode, "address")]

                            [#-- Stores the contact attributes of each news item in an array --]
                            [#assign allContacts += contacts]

                            [#-- Stores the addresses attributes of each news item in an array --]
                            [#assign allAddresses += addresses]

                        [/#list]

                        <script>

                            // We empty the contacts and addresses from the previous news.
                            let newsContacts_${childNode.@name} = [];
                            let newsAddresses_${childNode.@name} = [];

                            // We go through the contacts of the news.
                            [#list allContacts as contact]
                                
                                // We store them in the JavaScript array.
                                newsContacts_${childNode.@name}.push({
                                    firstName: "${contact.firstName!'Unspecified first name'}",
                                    familyName: "${contact.familyName!''}",
                                    email: "${contact.email!'Unspecified email'}",
                                    mobileNumber: "${contact.mobileNumber!''}",
                                    phoneNumber: "${contact.phoneNumber!'Unspecified phone number'}"
                                });
                                
                            [/#list]

                            // We go through the address of the news.
                            [#list allAddresses as address]

                                // We store them in the JavaScript array.
                                newsAddresses_${childNode.@name}.push({
                                    street: "${address.street!'Unspecified street'}",
                                    province: "${address.province!'Unspecified province'}",
                                    postalCode: "${address.postalCode!'Unspecified postal code'}",
                                    country: "${address.country!'Unspecified country'}"
                                });

                            [/#list]

                        </script>

                        [#-- Card footer --]
                        <div class="card-footer">
                            <button class="button-card" onclick="newsDetails(newsContacts_${childNode.@name}, newsAddresses_${childNode.@name})">
                               
                                [#-- Translate details --]
                                ${i18n['macros.getCards.detailed']}

                                [#-- Translate news or products --]
                                [#if targetWorkspace == "news"]
                                    ${i18n['macros.getCards.news']}
                                [#elseif targetWorkspace == "products"]
                                    ${i18n['macros.getCards.products']}
                                [/#if]

                                <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 -960 960 960" width="24"><path d="M647-440H160v-80h487L423-744l57-56 320 320-320 320-57-56 224-224Z"/
                                    <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2">
                                    </polygon>
                                </svg>
                            </button>

                        </div>
                    </article>
                [/#list]

            [#-- Preventive control notification --]
            [#elseif cmsfn.editMode]
                <script>thereIsNoContent()</script>
            [/#if]

        [#-- Preventive control notification --]
        [#elseif cmsfn.editMode]
            <script>amountContentDisplay()</script>
        [/#if]

        [#-- The container renders the news details and closing the window deletes the news --]
        <div id="show-details">
            <button class="hideNewsDetails" onclick="hideNewsDetails()">X</button>
        </div>

    [/#if]

[/#macro]