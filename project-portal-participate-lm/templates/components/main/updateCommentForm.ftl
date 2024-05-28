[#-- We obtain the UUID that has been passed to us through the url --]
[#assign postUUID = ctx.getParameter("uuid")!]

[#-- Header text --]
<div class="text">
    <h1>${content.title}</h1>
    <h2>${content.subTitle}</h2>
    <br/>
</div>

[#-- Form post --]
<form id="update-commentForm-form" action="#"  method="put">
    <fieldset>
        <input
            type="text"
            id="post-name"
            name="name"
            minlength="4"
            maxlength="50"
            placeholder="${ctx.user.name}"
            value="${ctx.user.name}"
            readonly
            required />
        <div class="post-name"></div>
        <textarea
            id="post-message"
            name="mensaje"
            rows="4"
            minlength="1"
            maxlength="200" placeholder="${content.messagePlaceholder}"
            required></textarea>
        <div class="post-message"></div>
        <input type="hidden" id="postId" name="postId" value="${postUUID}" />
    </fieldset>
</form>