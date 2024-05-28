document.addEventListener("DOMContentLoaded", function() 
{
    // Get the first h1 element in the document.
    let pageTitle = document.querySelector('h1')
    let elementsWithTextClass = document.querySelectorAll('.text')

    // Select the element with ID "page-redirection".
    let pageRedirection = document.getElementById('page-redirection')

    // Check if the element with ID "page-redirection" contains the text "Crear cuenta nueva".
    if (pageRedirection && pageRedirection.textContent.trim() === '👉 Crear cuenta nueva')
    {
        // We replace the h1 text.
        pageTitle.textContent = 'ACCEDER'

        // We replace the element text.
        elementsWithTextClass.forEach(function(element) 
        {
            if (element.textContent.includes('Access exclusive Portal Participate content.'))
                element.textContent = element.textContent.replace('Access exclusive Portal Participate content.', 'Accede a contenidos exclusivos del Portal Participa.');
        })
    }
})