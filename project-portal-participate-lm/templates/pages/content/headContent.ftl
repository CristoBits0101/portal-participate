[#-- Page type template --]
[@cms.page /]

[#-- Meta information --]
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

[#-- Page title --]
<title>${content.title}</title>

[#-- Google fonts --]
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&family=Dancing+Script:wght@400..700&family=Edu+NSW+ACT+Foundation:wght@400..700&family=Heebo:wght@100..900&family=Jost:ital,wght@0,100..900;1,100..900&family=Noto+Sans+KR:wght@100..900&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Raleway:ital,wght@0,100..900;1,100..900&family=Source+Code+Pro:ital,wght@0,200..900;1,200..900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&family=Dancing+Script:wght@400..700&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&family=Courgette&family=Dancing+Script:wght@400..700&family=Edu+NSW+ACT+Foundation:wght@400..700&family=Heebo:wght@100..900&family=Jost:ital,wght@0,100..900;1,100..900&family=Macondo&family=Noto+Sans+KR:wght@100..900&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Raleway:ital,wght@0,100..900;1,100..900&family=Rancho&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&family=Source+Code+Pro:ital,wght@0,200..900;1,200..900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&family=Courgette&family=Dancing+Script:wght@400..700&family=Edu+NSW+ACT+Foundation:wght@400..700&family=Heebo:wght@100..900&family=Indie+Flower&family=Jost:ital,wght@0,100..900;1,100..900&family=Macondo&family=Noto+Sans+KR:wght@100..900&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Raleway:ital,wght@0,100..900;1,100..900&family=Rancho&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&family=Silkscreen:wght@400;700&family=Source+Code+Pro:ital,wght@0,200..900;1,200..900&display=swap" rel="stylesheet">

[#-- Cached CSS Styles --]
${resfn.cachedCss("/project-portal-participate/webresources/css/interactivity/animation-transition.css")}
${resfn.cachedCss("/project-portal-participate/webresources/css/interactivity/media-query.css")}

[#-- Cached JS Script --]
${resfn.cachedJs("/project-portal-participate/webresources/js/chat/chat-service.js", "type='module'")}
${resfn.cachedJs("/project-portal-participate/webresources/js/format/textarea.js")}
${resfn.cachedJs("/project-portal-participate/webresources/js/news/load-news-details.js")}
${resfn.cachedJs("/project-portal-participate/webresources/js/news/hide-news-details.js")}
${resfn.cachedJs("/project-portal-participate/webresources/js/navbar/hide-settings-modal.js")}
${resfn.cachedJs("/project-portal-participate/webresources/js/navbar/load-settings-modal.js")}
${resfn.cachedJs("/project-portal-participate/webresources/js/btn/handle-login-button-visibility.js")}
${resfn.cachedJs("/project-portal-participate/webresources/js/navbar/hide-logo-image.js")}
${resfn.cachedJs("/project-portal-participate/webresources/js/posts/destroy-post.js")}

[#-- FreeMarker Macros --]
[#include "/project-portal-participate/templates/macros/registryVariables.ftl"]