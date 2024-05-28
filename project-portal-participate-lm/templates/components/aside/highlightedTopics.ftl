[#if ctx.user.name != "anonymous"]

    [#-- Offers IMG --]
    [#assign asset = damfn.getAsset(content.offers)!]
    [#assign top = damfn.getAsset(content.top)!]

    [#-- We get the user --]
    [#assign user = ctx.user]

    [#-- We get your identifier --]
    [#assign userUUID = user.getIdentifier()]

    [#-- We extract the user data from workspace users --]
    [#assign characteristics = cmsfn.contentById(userUUID, "users")]

    [#-- We obtain the page identifier --]
    [#assign targetPage = cmsfn.contentById(content.url)!]

    [#-- We save the link --]
    [#assign link = cmsfn.link(targetPage)!]

    [#-- If the user has added interests --]
    [#if characteristics.interests?has_content]

        [#-- We take the user's interests --]
        [#assign interests = characteristics.interests?split("__")]

        [#-- Column title --]
        <header>
            [#if asset?has_content]
                <img src="${asset.link}" alt="Offers" />
            [/#if]
            <h2>${content.highlightedTopicsTitle}</h2>
        </header>

        [#-- We check if the specified workspace from which to retrieve the content was indicated --]
        [#assign workspaceNode = cmsfn.contentByPath("/", "products")!]

        [#-- We take the reference of the parent node from which we want to iterate over the children --]
        [#assign childrenNodeType = cmsfn.children(workspaceNode, "products")]

        [#-- We store in a collection all the children with the node type products --]
        [#assign contentOrderReversed = childrenNodeType?reverse]

        [#-- We reverse the order of the collection to display the news from the latest publication to the oldest --]
        [#if content.amountContentDisplay?has_content && content.amountContentDisplay > 0]

            [#-- We check that the user has entered a value for the number of news items they want to see --]
            [#if contentOrderReversed?? && (contentOrderReversed?size == content.amountContentDisplay) || (contentOrderReversed?size > content.amountContentDisplay) && (contentOrderReversed?size > 0)]

                [#-- If contentOrderReversed is null, the conditional won't execute, skipping the exception error --]
                [#list contentOrderReversed[0..(content.amountContentDisplay)-1] as childNode]

                    [#-- We get the child node --]
                    [#assign jcrNode = cmsfn.asJCRNode(childNode)]

                    [#-- We get the content and its UUID --]
                    [#assign contentMap = cmsfn.asContentMap(jcrNode)]

                    [#-- We get the content and its UUID --]
                    [#assign UUID = jcrNode.getIdentifier()]

                    [#list tagfn.getTags(contentMap) as tag]
                        [#if interests?seq_contains(tag)]

                            <section>
                                <article>
                                    <h3>${cmsfn.wrapForI18n(childNode).title!}</h3>
                                </article>
                                <a href="${link}?uuid=${UUID}" class="animated-button" target="_blank">
                                    [#if top?has_content]
                                        <img src="${top.link}" alt="Offers" />
                                    [/#if]
                                    <b>${content.buttonText}</b>
                                </a>
                            </section>

                            [#-- Confirm match --]
                            [#assign coincidence = 1]

                        [/#if]
                    [/#list]
                [/#list]

                [#-- If there was no coincidence of interests --]
                [#if coincidence != 1]

                    [#-- If contentOrderReversed is null, the conditional won't execute, skipping the exception error --]
                    [#list contentOrderReversed[0..(content.amountContentDisplay)-1] as childNode]

                        [#-- We get the child node --]
                        [#assign jcrNode = cmsfn.asJCRNode(childNode)]

                        [#-- We get the content and its UUID --]
                        [#assign UUID = jcrNode.getIdentifier()]

                        <section>
                            <article>
                                <h3>${cmsfn.wrapForI18n(childNode).title!}</h3>
                            </article>
                            <a href="${link}?uuid=${UUID}" class="animated-button" target="_blank">
                                [#if top?has_content]
                                    <img src="${top.link}" alt="Offers" />
                                [/#if]
                                <b>${content.buttonText}</b>
                            </a>
                        </section>

                        [#-- Confirm match --]
                        [#assign coincidence = 1]

                    [/#list]
                [/#if]
            [/#if]
        [/#if]

    [#-- If the user has not added interests --]
    [#else]

        [#-- Column title --]
        <header>
            [#if asset?has_content]
                <img src="${asset.link}" alt="Offers" />
            [/#if]
            <h2>${content.highlightedTopicsTitle}</h2>
        </header>

        [#-- We check if the specified workspace from which to retrieve the content was indicated --]
        [#assign workspaceNode = cmsfn.contentByPath("/", "products")!]

        [#-- We take the reference of the parent node from which we want to iterate over the children --]
        [#assign childrenNodeType = cmsfn.children(workspaceNode, "products")]

        [#-- We store in a collection all the children with the node type products --]
        [#assign contentOrderReversed = childrenNodeType?reverse]

        [#-- We reverse the order of the collection to display the news from the latest publication to the oldest --]
        [#if content.amountContentDisplay?has_content && content.amountContentDisplay > 0]

            [#-- We check that the user has entered a value for the number of news items they want to see --]
            [#if contentOrderReversed?? && (contentOrderReversed?size == content.amountContentDisplay) || (contentOrderReversed?size > content.amountContentDisplay) && (contentOrderReversed?size > 0)]

                [#-- If contentOrderReversed is null, the conditional won't execute, skipping the exception error --]
                [#list contentOrderReversed[0..(content.amountContentDisplay)-1] as childNode]

                    [#-- We get the child node --]
                    [#assign jcrNode = cmsfn.asJCRNode(childNode)]

                    [#-- We get the content and its UUID --]
                    [#assign UUID = jcrNode.getIdentifier()]

                    <section>
                        <article>
                            <h3>${cmsfn.wrapForI18n(childNode).title!}</h3>
                        </article>
                        <a href="${link}?uuid=${UUID}" class="animated-button" target="_blank">
                            [#if top?has_content]
                                <img src="${top.link}" alt="Offers" />
                            [/#if]
                            <b>${content.buttonText}</b>
                        </a>
                    </section>

                    [#-- Confirm match --]
                    [#assign coincidence = 1]

                [/#list]
            [/#if]
        [/#if]
    [/#if]
[/#if]