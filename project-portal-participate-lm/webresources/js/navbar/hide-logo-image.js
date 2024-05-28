const checkResolution = () => 
{
    // Get the screen width.
    let screenWidth = window.innerWidth

    // Check if the screen is at a resolution greater than 768px.
    if (screenWidth > 768) 
    {
        // Get the div with the row class.
        let rowDiv = document.querySelector('.row')

        // Check if the div with the row class was found.
        if (rowDiv) 
        {
            // Get the first child of the div with the row class.
            let firstChild = rowDiv.firstElementChild

            // Check if the first child is found and display it.
            if (firstChild)
                firstChild.style.display = ''
        }
    } 
    
    else 
    {
        // Get the div with the row class.
        let rowDiv = document.querySelector('.row')

        // Check if the div with the row class was found.
        if (rowDiv) 
        {
            // Get the first child of the div with the row class.
            let firstChild = rowDiv.firstElementChild

            // Check if the first child is found and hide it.
            if (firstChild)
                firstChild.style.display = 'none'
        }
    }
}

// Execute the function when the page loads and on each window resize.
window.addEventListener('load', checkResolution)
window.addEventListener('resize', checkResolution)