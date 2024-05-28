[#-- Chat Header Container --]
<div id="chat-header-container">
    [@cms.area name="header" /]
</div>

[#-- Chat Console Container --]
<div id="chat-console-container">
    [#if content.titleChat?has_content]
        <h2>${content.titleChat}<h2>
        <br />
    [/#if]
    [#if content.informativeMessage?has_content]
        <h3>${cmsfn.decode(content).informativeMessage!}<h3>
        <br />
    [/#if]
</div>

[#-- Chat Input Container --]
<div id="chat-input-container">
    <p>
        <textarea id="dialog-input" placeholder="${content.textareaMensaje}" rows="1" dir="auto" tabindex="0" spellcheck="false"></textarea>
    </p>
</div>