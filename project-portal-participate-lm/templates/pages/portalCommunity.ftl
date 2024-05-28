<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">

    <head>

        [#-- Meta information --]
        [#include "/project-portal-participate/templates/pages/content/headContent.ftl"]

        [#-- Exclusive CSS --]
        ${resfn.cachedCss("/project-portal-participate/webresources/css/pages/portal-community.css")}

    </head>

    <body>

        [#-- Related but independent content --]
        <aside>
            [@cms.area name="aside" /]
        </aside>

        [#-- Main content of the page --]
        <main>
            [@cms.area name="main" /]
        </main>

        [#-- Body Scripts --]
        [#include "/project-portal-participate/templates/pages/content/bodyScripts.ftl"]

    </body>

    ${resfn.cachedJs("/project-portal-participate/webresources/js/format/banner-h1.js")}

</html>