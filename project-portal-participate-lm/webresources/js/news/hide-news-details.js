// Function to hide the div and reset the position.
const hideNewsDetails = () => 
{
    // We get the element we want to hide.
    const showDetailsDiv = document.getElementById("show-details")

    if (showDetailsDiv) 
    {
        // Hide the div.
        showDetailsDiv.style.zIndex = "-9999"
        showDetailsDiv.style.position = "block"
        showDetailsDiv.style.visibility = "hidden"
    }

    // Reset the body scrollbar.
    document.body.classList.remove("hide-scrollbar")

    // Reset the window scroll bar.
    document.body.classList.remove("hide-window-scrollbar")
}