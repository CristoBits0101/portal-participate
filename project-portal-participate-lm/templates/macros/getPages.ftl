[#-- Script to translate the navbar --]
${resfn.cachedJs("/project-portal-participate/webresources/js/api/my-memory.js")}

[#-- We create the portalNavigation macro and pass parentPage as an argument, which is the node from where it will start --]
[#macro getPages targetNode assetIcon=""]

    <nav class="menu-button">
        <ul>

            [#-- If an icon was included, the name is replaced by the icon --]
            [#if assetIcon?has_content]

                <li class="rotate--360">
                    <a href="${cmsfn.link(targetNode)!}">
                        <img class="asset-logo transUp" src="${assetIcon.link}">
                    </a>
                </li>

            [#-- Otherwise, you enter the name of the image, and failing that, its title --]
            [#else]

                <li class="transUp">
                    <a href="${cmsfn.link(targetNode)!}">Home</a>
                </li>
                
            [/#if]

            [#assign counter = 1 /]

            [#-- In each iteration, it retrieves all children of type 'mgnl page' from the targetNode and stores them in the 'childNode' variable --]
            [#list cmsfn.children(targetNode, "mgnl:page") as childNode]

                [#-- Creates the link to the child node of type page using your name or title --]
                <li class="transUp">
                    <a id="translationDisplay${counter}" href="${cmsfn.link(childNode)!}">

                        [#-- We store the language of the page --]
                        [#assign language = state.locale!]

                        [#-- If the language is English we print the name of the page --]
                        [#if language?trim?lower_case == "en"]

                            ${childNode.@name!childNode.title}

                        [#elseif language?trim?lower_case == "es"]

                            <script>
                               mymemory("${childNode.@name!childNode.title}", "en", "es")
                                    .then(translation => {
                                        document.getElementById('translationDisplay${counter}').innerHTML = translation;
                                    })
                                    .catch(error => {
                                        console.error('Error getting translation:', error);
                                        throw error;
                                    });
                            </script>

                        [/#if]

                    </a>
                </li>

                [#assign counter += 1 /]

            [/#list]
        </ul>
    </nav>
[/#macro]