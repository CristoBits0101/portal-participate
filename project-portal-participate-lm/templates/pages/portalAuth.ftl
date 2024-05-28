<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">

    <head>

        [#-- Meta information --]
        [#include "/project-portal-participate/templates/pages/content/headContent.ftl"]

        [#-- Exclusive CSS --]
        ${resfn.cachedCss("/project-portal-participate/webresources/css/pages/portal-auth.css")}

        [#-- Exclusive JS --]
        ${resfn.cachedJs("/project-portal-participate/webresources/js/body/show-body-auth.js")}
        ${resfn.cachedJs("/project-portal-participate/webresources/js/comments/initial-visibility.js")}

    </head>

    <body>

        [#-- Hidden redirect scripts --]
        [@cms.area name="hiddenContent" /]

        [#-- Main content of the page --]
        <main>
            [@cms.area name="main" /]
        </main>

        [#-- Body Scripts --]
        [#include "/project-portal-participate/templates/pages/content/bodyScripts.ftl"]

    </body>

</html>