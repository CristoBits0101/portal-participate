<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">

    <head>

        [#-- Meta information --]
        [#include "/project-portal-participate/templates/pages/content/headContent.ftl"]

        [#-- Exclusive CSS --]
        ${resfn.cachedCss("/project-portal-participate/webresources/css/global-styles.css")}
        ${resfn.cachedCss("/project-portal-participate/webresources/css/pages/portal-home.css")}

    </head>

    <body>

        [#-- Navbar content --]
        <div class="navbar-container">
            [@cms.area name="nav" /]
        </div>

        [#-- Header content --]
        <header>
            [@cms.area name="header" /]
        </header>

        [#-- Main content of the page --]
        <main>
            [@cms.area name="main" /]
        </main>

        [#-- Related but independent content --]
        <aside>
            [@cms.area name="aside" /]
        </aside>

        [#-- Footer content --]
        <footer>
            [@cms.area name="footer" /]
        </footer>

        [#-- Body Scripts --]
        [#include "/project-portal-participate/templates/pages/content/bodyScripts.ftl"]
        ${resfn.cachedJs("/project-portal-participate/webresources/js/format/banner-h1.js")}

    </body>

</html>