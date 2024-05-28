[#-- We obtain the UUID that has been passed to us through the url --]
[#assign productUUID = ctx.getParameter("uuid")!]

[#-- Product Container --]
<article class="product-container">

    [#-- We check if any UUID was passed to us through the URL --]
    [#if productUUID?? && productUUID != ""]

        [#-- We obtain the root of the workspace products --]
        [#assign workspaceNode = cmsfn.contentByPath("/", "products")!]

        [#-- We take the children nodes of the root with the node type products --]
        [#assign childrenNodeType = cmsfn.children(workspaceNode, "products")]
    
        [#-- We iterate over all the child nodes --]
        [#list childrenNodeType as childNode]

            [#-- We get the child node --]
            [#assign jcrNode = cmsfn.asJCRNode(childNode)]

            [#-- We get the UUID  --]
            [#assign childNodeUUID = jcrNode.getIdentifier()]

            [#-- We compare the UUIDs --]
            [#if productUUID == childNodeUUID]
                <section class="image-container">

                    [#-- Card imagen --]
                    [#if childNode.imageLink?has_content]

                        [#assign myAsset = damfn.getAsset(childNode.imageLink)]
                        <img src="${myAsset.link}" alt="${childNode.title}" title="${childNode.title}">

                    [#-- Default imagen --]
                    [#else]

                        [#assign myAsset = damfn.getAsset("jcr:874a154f-93a8-4a73-8132-580fbdb87cb1")]
                        <img src="${myAsset.link}" alt="Facebook" title="Facebook" class="list-image">

                    [/#if]

                </section>

                <section class="title-container">
                    <h1>${childNode.title}</h1>
                </section>
                
                <section class="description-container">

                    ${cmsfn.wrapForI18n(childNode).message!"<p>The news article does not have a description...</p>"}

                    <ul>
                        <li><span>${i18n['starts.event']}:</span> ${childNode.starts!"Unspecified beginning"}</li>
                        <li><span>${i18n['ends.event']}:</span> ${childNode.ends!"Unspecified ending"}</li>
                        <li><span>${i18n['location.event']}:</span> ${cmsfn.wrapForI18n(childNode).location!"Unspecified location"}</li>
                    </ul>

                    [#-- From each news item, we retrieve child nodes of type mgnl:contentNode --]
                    [#assign mgnlContentNodes = cmsfn.children(childNode, "mgnl:contentNode")]

                    [#-- Inicializar allContactNodes como una lista vacía antes de entrar en el bucle --]
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

                    [#-- Sub models --]
                    <article class="sub-models">
                        <section class="contact-info">
                            <h2>${i18n['contact.information']}:</h2>
                            [#list allContacts as contact]
                                <ul>
                                    <li><span>${i18n['first.name']}:</span> ${contact.firstName!"Unspecified first name"}</li>
                                    <li><span>${i18n['family.name']}:</span> ${contact.familyName!"Unspecified family name"}</li>
                                    <li><span>${i18n['contact.email']}:</span> ${contact.email!"Unspecified email"}</li>
                                    <li><span>${i18n['mobile.number']}:</span> ${contact.mobileNumber!"Unspecified mobile number"}</li>
                                    <li><span>${i18n['phone.number']}:</span> ${contact.phoneNumber!"Unspecified phone number"}</li>
                                </ul>
                            [/#list]
                        </section>
                        <section class="address-info">
                            <h2>${i18n['address.information']}:</h2>
                            [#list allAddresses as address]
                                <ul>
                                    <li><span>${i18n['address.street']}:</span> ${address.street!"Unspecified street"}</li>
                                    <li><span>${i18n['address.province']}:</span> ${address.province!"Unspecified province"}</li>
                                    <li><span>${i18n['postal.code']}:</span> ${address.postalCode!"Unspecified postal code"}</li>
                                    <li><span>${i18n['address.country']}:</span> ${address.country!"Unspecified country"}</li>
                                </ul>
                            [/#list]
                        </section>
                    </article>
                </section>
            [/#if]
        [/#list]
    [/#if]
</article>