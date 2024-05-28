// Getting the modal and the button to open it.
var modal = document.getElementById("myModal")
var openBtn = document.querySelector(".open-modal")

if (openBtn && modal) 
{
    // When the button is clicked, show the modal and adjust its positioning.
    openBtn.onclick = function () 
    {
        modal.style.display = "flex"
        modal.classList.add("justify-end")
    }

    // When clicking outside the modal, hide it and reset its positioning.
    window.onclick = function (event)
    {
        if (event.target == modal)
        {
            modal.style.display = "none"
            modal.classList.remove("justify-end")
        }
    }
}