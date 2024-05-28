[#-------------- ASSIGNMENTS --------------]
[#-- Conditional rendering based on the number of elements added to the footer --]
[#assign divColClass = "component" /]

[#-------------- RENDERING --------------]
[#-- The system provides automatically to every Area script: All components of the area as a list components. Therefore looping over each component --]
<div class="row">
    [#list components as component ]
        <div class="${divColClass}">

            [#-- Triggering the rendering of each component node --]
            [@cms.component content=component /]

        </div>
    [/#list]
</div>