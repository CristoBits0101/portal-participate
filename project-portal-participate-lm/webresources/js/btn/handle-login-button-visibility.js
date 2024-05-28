// Function to manage the visibility of login buttons based on screen size.
function handleLoginButtonVisibility() 
{
    var screenWidth = window.innerWidth
    var loginButtonA = document.getElementById("login-a")
    var loginButtonB = document.getElementById("login-b")

    // If the screen is tablet or mobile size.
    if (screenWidth <= 768) 
    {
        if (loginButtonA)
            loginButtonA.parentElement.style.display = "none" //Hide the "a" button.

        if (loginButtonB)
            loginButtonB.parentElement.style.display = "flex" // Show the "b" button.
    } 

    // If the screen is computer or television size.
    else 
    {
        if (loginButtonA)
            loginButtonA.parentElement.style.display = "flex" //Hide the "a" button.

        if (loginButtonB)
            loginButtonB.parentElement.style.display = "none" // Show the "b" button.
    }
}

// Manage the visibility of the login buttons when loading the page.
document.addEventListener("DOMContentLoaded", function () 
{
    // Manage the visibility of the login buttons when loading the page.
    handleLoginButtonVisibility()
})

// Remanage the visibility of login buttons when changing the window size.
window.addEventListener("resize", function () 
{
    // Handle the visibility of login buttons when changing the window size.
    handleLoginButtonVisibility()
})