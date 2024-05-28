[#-- Forum Header Container --]
<div id="forum-header-container">
    [@cms.area name="header" /]
</div>

[#-- Forum Section Container --]
<div id="forum-section-container">

    [#assign workspaceNode = cmsfn.contentByPath("/", "forum")!]
    [#assign childrenNodeType = cmsfn.children(workspaceNode, "forum")]
    [#assign contentOrderReversed = childrenNodeType?reverse]

    [#assign idGenerator = 0]

    [#list contentOrderReversed as childNode]
 
        [#assign comments = childNode.comments?has_content?then(cmsfn.children(childNode.comments, "mgnl:contentNode"), [])]

        <section class="post-section-container">

            [#-- Get UUID --]
            [#assign jcrNode = cmsfn.asJCRNode(childNode)]
            [#assign uuid = jcrNode.getIdentifier()]

            <article class="button-container">
                [#if content.updateIcon?has_content && ctx.user.name == childNode.postAuthor]
                    <button type="button" class="update">
                        [#assign page = cmsfn.contentById(content.updatePage)!]
                        <a href="${cmsfn.link(page)!}?uuid=${uuid}">
                            [#assign assetIcon = damfn.getAsset(content.updateIcon)!]
                            <img src="${assetIcon.link}">
                        </a>
                    </button>
                [/#if]
                [#if content.deleteIcon?has_content && ctx.user.name == childNode.postAuthor]
                    <button type="button" onClick="destroyPost('${uuid}')" class="delete">
                        [#assign assetIcon = damfn.getAsset(content.deleteIcon)!]
                        <img src="${assetIcon.link}">
                    </button>
                [/#if]
            </article>

            <article class="post-header">

                [#assign myAsset = damfn.getAsset("jcr:bac422a1-8d46-456b-a199-9f3d0e7e0d40")]
                <img src="${myAsset.link}">

                [#-- Get time --]
                [#assign created = jcrNode.getProperty("mgnl:created").getString()]
                [#assign createdDate = created?datetime("yyyy-MM-dd'T'HH:mm:ss.SSSX")]

                <h2>${cmsfn.wrapForI18n(childNode).postAuthor!} • <span>${createdDate?string["EEEE d, MMMM yyyy, HH:mm:ss"]?cap_first!}</span><h2>

            </article>

            <article class="post-header">
                <h3>${cmsfn.wrapForI18n(childNode).title!}</h3>
            </article>

            <article class="post-body">
                ${cmsfn.wrapForI18n(childNode).message!}
            </article>

            <article class="post-footer">

                [#-- Like icon --]
                [#if content.likeIcon?has_content]
                    [#assign assetIcon = damfn.getAsset(content.likeIcon)!]
                    <button type="button">
                        <img src="${assetIcon.link}">
                        ${content.likeButtonText}
                    </button>
                [#else]
                    <button type="button">${content.likeButtonText}</button>
                [/#if]

                [#-- Repost icon --]
                [#if content.repostIcon?has_content]
                    [#assign assetIcon = damfn.getAsset(content.repostIcon)!]
                    <button type="button">
                        <img src="${assetIcon.link}">
                        ${content.repostButtonText}
                    </button>
                [#else]
                    <button type="button">${content.repostButtonText}</button>
                [/#if]

                [#-- Comment icon --]
                [#if content.commentIcon?has_content]
                    [#assign assetIcon = damfn.getAsset(content.commentIcon)!]
                    <button type="button" onClick="changeCommentVisibility('comment-container-${idGenerator}')">
                        <img src="${assetIcon.link}">
                        ${content.commentButtonText}
                    </button>
                [#else]
                    <button type="button" onClick="changeCommentVisibility('comment-container-${idGenerator}')">
                        ${content.commentButtonText}
                    </button>
                [/#if]

                [#-- Send icon --]
                [#if content.sendIcon?has_content]
                    [#assign assetIcon = damfn.getAsset(content.sendIcon)!]
                    <button type="button">
                        <img src="${assetIcon.link}">
                        ${content.sendButtonText}
                    </button>
                [#else]
                    <button type="button">${content.sendButtonText}</button>
                [/#if]

            </article>

            <article id="comment-container-${idGenerator}" class="comment-container">
                <article class="button-container">
                    [#if content.updateIcon?has_content && ctx.user.name == childNode.postAuthor]
                        <button type="button" class="update">
                            [#assign page = cmsfn.contentById(content.updatePage)!]
                            <a href="${cmsfn.link(page)!}?uuid=${uuid}">
                                [#assign assetIcon = damfn.getAsset(content.updateIcon)!]
                                <img src="${assetIcon.link}">
                            </a>
                        </button>
                    [/#if]
                    [#if content.deleteIcon?has_content && ctx.user.name == childNode.postAuthor]
                        <button type="button" onClick="destroyPost('${uuid}')" class="delete">
                            [#assign assetIcon = damfn.getAsset(content.deleteIcon)!]
                            <img src="${assetIcon.link}">
                        </button>
                    [/#if]
                </article>
                [#if comments?size > 0]
                    [#list comments as comment]
                        <div class="comment-container-header">
                            <img src="${myAsset.link}">
                            <p><span>${comment.commentVisitor}<span></p>
                        </div>
                        <p>${comment.comment}</p>
                        <br/>
                    [/#list]
                [#else]
                    <p>${content.defaultCommentText}</p>
                [/#if]
            </article>

        </section>

        [#assign idGenerator += 1]

    [/#list]

</div>

[#-- Forum Footer Container --]
<div id="forum-panel-container">
</div>