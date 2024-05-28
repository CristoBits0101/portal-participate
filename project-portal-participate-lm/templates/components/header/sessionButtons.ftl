[#if ctx.user.name == "Anonymous"]

    <nav id="session-navbar">
        <ul id="session-navbar-ul">

            [#-- Login page --]
            [#assign landingPage = cmsfn.contentById(content.login)!]

            [#if landingPage?has_content]
                <li class="login-register-btn">
                    <a class="btn" href="${cmsfn.link(landingPage)!}">
                        ${content.loginButtonText}
                    </a>
                </li>
            [/#if]

            [#-- Register page --]
            [#assign landingPage = cmsfn.contentById(content.register)!]

            [#if landingPage?has_content]
                <li class="login-register-btn">
                    <a class="btn" href="${cmsfn.link(landingPage)!}">
                        ${content.registerButtonText}
                    </a>
                </li>
            [/#if]
            
        </ul>
    </nav>

[#else]

    <div class="settings-container">

        [#-- Get the asset --]
        [#assign myAsset = damfn.getAsset("jcr:92abecb4-3242-43e1-9cf0-754fcd05113e")]

        [#-- Image that opens the modal when clicked --]
        <img src="${myAsset.link}" alt="Settings" title="Settings" class="open-modal settings rotate">

        [#-- The modal --]
        <div id="myModal" class="modal">
            <div class="modal-content">

                [#-- User name --]
                <p class="userName">${ctx.user.name}</p>

                [#-- Get the asset --]
                [#assign profilePicture = damfn.getAsset("jcr:bac422a1-8d46-456b-a199-9f3d0e7e0d40")]

                [#-- Image that opens the modal when clicked --]
                <img src="${profilePicture.link}" alt="Profile Picture" title="Profile Picture" class="open-modal settings">

                [#-- User email --]
                <p class="session-paragraph" id="center-email">${ctx.user.email}</p>

                [#-- Change language --]
                <div class="languageContainer">

                    <label for="languageSelector">🌐 ${content.changeLanguage}</label>
                    <select id="languageSelector">

                        [#-- We store the language of the page --]
                        [#assign language = state.locale!]

                        [#-- If the language is English we print the name of the page --]
                        [#if language?trim?lower_case == "en"]

                            <option value="en" selected>
                                ${content.englishLanguage}
                            </option>
                            <option value="es">
                                ${content.spanishLanguage}
                            </option>

                        [#elseif language?trim?lower_case == "es"]

                            <option value="en">
                                ${content.englishLanguage}
                            </option>
                            <option value="es" selected>
                                ${content.spanishLanguage}
                            </option>

                        [/#if]

                    </select>
                </div>

                [#if language?trim?lower_case == "en"]
                    <script>

                        // Add an event listener to the "change" event of the language selector.
                        document.getElementById("languageSelector").addEventListener("change", () => 
                        {
                            // Get the selected option from the <select> element.
                            const selectedOption = document.getElementById("languageSelector").value

                            // Build the redirect URL based on the selected language.
                            let redirectURL

                            if (selectedOption === "es")
                                redirectURL = `${ctx.contextPath}/es${state.originalURI}`

                            else if (selectedOption === "en")
                                redirectURL = `${ctx.contextPath}${state.originalURI}`

                            if (redirectURL)
                                    window.location.href = redirectURL
                        })

                    </script>
                [#elseif language?trim?lower_case == "es"]
                    <script>

                        // Add an event listener to the "change" event of the language selector.
                        document.getElementById("languageSelector").addEventListener("change", () => 
                        {
                            // Get the selected option from the <select> element.
                            const selectedOption = document.getElementById("languageSelector").value

                            // Build the redirect URL based on the selected language.
                            let redirectURL

                            if (selectedOption === "es")
                                redirectURL = `${ctx.contextPath}${state.originalURI}`

                            else if (selectedOption === "en")
                                redirectURL = `${ctx.contextPath}${state.originalURI}`
                                redirectURL = redirectURL.replace('/es', '')
                            
                            if (redirectURL)
                                    window.location.href = redirectURL
                        })

                    </script>
                [/#if]

                [@cms.area name="sessionPages" /]

                [#-- Sign off --]
                <p class="session-paragraph" id="logoutLinkContainer">
                    <script>

                        // We store the Magnolia instance.
                        let contextPath = "${ctx.contextPath}"

                        // We modify the values if it is not what was expected.
                        if (contextPath === "/magnoliaauthor")
                            contextPath = "/magnoliaAuthor"

                        else if (contextPath === "/magnoliapublic")
                            contextPath = "/magnoliaPublic"
                        
                        // We ride the absolute route.
                        let absolutePath = `${contextPath}/portalparticipate/user-registration/user-login.html?mgnlLogout=true`
                        let logoutLink = document.createElement('a')

                        // 
                        logoutLink.href = absolutePath
                        logoutLink.innerHTML = `❌ ${content.logoutButtonText}`

                        // 
                        document.getElementById('logoutLinkContainer').appendChild(logoutLink)

                    </script>
                </p>

            </div>
        </div>

    </div>

[/#if]