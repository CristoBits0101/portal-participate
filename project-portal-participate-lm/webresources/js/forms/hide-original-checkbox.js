// Wait for the page content to be fully loaded.
document.addEventListener("DOMContentLoaded", function () 
{
    // Get all fieldset elements with the class 'mod'.
    let fieldsets = document.querySelectorAll('fieldset.mod')

    // Iterate over the found fieldsets and hide each fieldset's parent div.
    fieldsets.forEach(function (fieldset) 
    {
        let parentDiv = fieldset.parentNode;
        parentDiv.style.display = 'none';
    });
})