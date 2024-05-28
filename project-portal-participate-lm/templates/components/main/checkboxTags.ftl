[#if ctx.user.name != "anonymous"]

    [#-- We get the user --]
    [#assign user = ctx.user]

    [#-- We get your identifier --]
    [#assign userUUID = user.getIdentifier()]

    [#-- We extract the user data from workspace users --]
    [#assign characteristics = cmsfn.contentById(userUUID, "users")]

    [#-- If the user has added interests --]
    [#if characteristics?has_content && characteristics.interests?has_content]

        [#-- We store the user's interests --]
        [#assign userInterests = characteristics.interests]

        [#-- Check if userInterests contains the "__" delimiter before doing the split --]
        [#if userInterests?contains("__")]
            [#assign userInterests = userInterests?split("__")]
        [/#if]
    [/#if]
[/#if]


[#-- A --]
[#assign tagsRoot = cmsfn.contentByPath("/", "tags")!]
[#assign initialsFolder = cmsfn.children(tagsRoot)![]]

[#-- B --]
[#assign workspaceNode = cmsfn.contentByPath("/", "products")!]
[#assign childrenNodeType = cmsfn.children(workspaceNode, "products")]

[#-- C --]
[#assign coincidence = false]

<div class="form-row" id="tags">
    [#if initialsFolder?has_content]
        [#list initialsFolder as initialFolder]
            [#if initialFolder != "rep:accesscontrol"]
                [#assign carpetasTags = cmsfn.children(initialFolder)![]]
                [#list carpetasTags as carpetaTags]
                    [#assign tags = cmsfn.children(carpetaTags)![]]         
                    [#list tags as folderTag]
                        [#list childrenNodeType as childNode]
                            [#assign jcrNode = cmsfn.asJCRNode(childNode)]
                            [#assign contentMap = cmsfn.asContentMap(jcrNode)]
                            [#list tagfn.getTags(contentMap) as productTag]
                                [#if folderTag == productTag && !coincidence]
                                    [#if userInterests?is_sequence && userInterests?seq_contains(folderTag)]
                                        [#assign isChecked = true]
                                    [#elseif userInterests?is_string && userInterests == folderTag]
                                        [#assign isChecked = true]
                                    [#else]
                                        [#assign isChecked = false]
                                    [/#if]
                                    <div class="tags">
                                        <input type="checkbox" name="interests" value="${folderTag}" [#if isChecked]checked[/#if]>
                                        <p>${folderTag}</p>
                                    </div>
                                    [#assign coincidence = true]
                                [/#if]
                            [/#list]
                        [/#list]
                        [#assign coincidence = false]
                    [/#list]
                [/#list]
            [/#if]
        [/#list]
    [/#if]
</div>