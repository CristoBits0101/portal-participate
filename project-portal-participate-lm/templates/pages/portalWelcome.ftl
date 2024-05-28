<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">

    <head>

        [#-- Meta information --]
        [#include "/project-portal-participate/templates/pages/content/headContent.ftl"]

        [#-- Exclusive CSS --]
        ${resfn.cachedCss("/project-portal-participate/webresources/css/pages/portal-welcome.css")}

        [#-- Exclusive JS --]
        ${resfn.cachedJs("/project-portal-participate/webresources/js/body/show-body-welcome.js")}

    </head>

    <body>

        [#-- Hidden redirect scripts --]
        [@cms.area name="hiddenContent" /]

        <div class="container">

            [#-- Header content --]
            <header>

                [#-- Navbar content --]
                <nav>
                    <ul>

                        [#-- Login page --]
                        [#assign landingPage = cmsfn.contentById(content.login)!]

                        [#if landingPage?has_content]
                            <li>
                                <a class="btn" href="${cmsfn.link(landingPage)!}" id="login-a">
                                    ${content.loginButtonText}
                                </a>
                            </li>
                        [/#if]

                        [#-- Company logo --]
                        [#assign asset = damfn.getAsset(content.logo)!]

                        [#if asset?has_content]
                            <li id="welcome-logo">
                                <img src="${asset.link}" alt="PORTAL PARTICIPATE" />
                            </li>
                        [/#if]

                        [#-- Login page --]
                        [#assign landingPage = cmsfn.contentById(content.login)!]

                        [#if landingPage?has_content]
                            <li>
                                <a class="btn" href="${cmsfn.link(landingPage)!}" id="login-b">
                                    ${content.loginButtonText}
                                </a>
                            </li>
                        [/#if]

                        [#-- Register page --]
                        [#assign landingPage = cmsfn.contentById(content.register)!]

                        [#if landingPage?has_content]
                            <li>
                                <a class="btn" href="${cmsfn.link(landingPage)!}">
                                    ${content.registerButtonText}
                                </a>
                            </li>
                        [/#if]

                    </ul>
                </nav>

            </header>

            [#-- Main content of the page --]
            <main>

                [#-- Welcome title --]
                <h1>&nbsp${content.welcomeTitle}</h1>

                [#-- Welcome text --]
                ${cmsfn.decode(content).introduction!}

                [#-- Home page --]
                [#assign landingPage = cmsfn.contentById(content.goHome)!]
                
                [#if landingPage?has_content]
                    <a href="${cmsfn.link(landingPage)!}">
                        <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon></svg>
                        ${content.homeButtonText}
                    </a>
                [/#if]

            </main>

            [#-- Footer content --]
            <footer>

                [#-- Company text --]
                <h2>${content.companyText}</h2>

            </footer>

        </div>

        [#-- Body Scripts --]
        [#include "/project-portal-participate/templates/pages/content/bodyScripts.ftl"]

    </body>

</html>