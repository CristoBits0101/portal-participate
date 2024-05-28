// change the visibility of comment containers.
const changeCommentVisibility = (containerId) => 
{
    // Gets the container based on its id.
    let container = document.getElementById(containerId)
   
    // Change visibility depending on your status.
    if (container) {
        if (container.style.display === 'none')
            container.style.display = 'flex'
        else
            container.style.display = 'none'
    }
}