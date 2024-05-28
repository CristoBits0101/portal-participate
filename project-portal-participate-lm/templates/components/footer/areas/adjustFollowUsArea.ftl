[#-------------- ASSIGNMENTS --------------]
[#-- Conditional rendering based on the number of elements added to the footer --]
[#assign divColClass = "networks" /]

[#-------------- RENDERING --------------]
[#-- The system provides automatically to every Area script: All components of the area as a list components. Therefore looping over each component --]
<ul class="networks">
    [#list components as component ]
        <li>
            [#-- Triggering the rendering of each component node --]
            [@cms.component content=component /]
        </li>
    [/#list]
</ul>