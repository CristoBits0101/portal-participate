// Get the first <br> element inside an element with the class form.
var br = document.querySelector(".form > br")

// Check if a <br> element is found.
if (br !== null)

    // Remove the <br> from the DOM.
    br.parentNode.removeChild(br)