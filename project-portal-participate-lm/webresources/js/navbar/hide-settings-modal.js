// Function to hide the div and reset the position.
const hideSettingsModal = () => 
{
    // We get the element we want to hide.
    const myModal = document.getElementById("myModal")

    // Hide the div.
    myModal.style.zIndex = "-9999"
    myModal.style.position = "block"
    myModal.style.visibility = "hidden"
}