// Function to send a message via a socket.
export const sendMessage = (socket) => 
{
    // Get the value of the message from the element with the id 'dialog-input'.
    let message = document.getElementById('dialog-input').value

    // Check if the message is not empty.
    if (message !== 'null' && message !== 'undefined' &&  message !== '')
    {
        // Get the current date and time.
        let currentDate = new Date()

        // Format the date in dd/mm/yyyy format.
        let formattedDate = currentDate.toLocaleDateString('es-ES', { day: '2-digit', month: '2-digit', year: 'numeric' })
        
        // Format the time in hh:mm:ss format.
        let formattedTime = currentDate.toLocaleTimeString('es-ES', { hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: false })
        
        // Get the browser URL and convert the string to lowercase.
        let currentURL = window.location.href.toLowerCase()

        // Condition assignment depending on window language.
        let currentTime = currentURL.includes("/es") ? `${formattedDate} a las ${formattedTime}` : `${formattedDate} at ${formattedTime}`

        // Send the formatted date and time via the socket.
        socket.send(userName + ' userTime ' + currentTime +  ' linebreak ' + message)

        // Clear the message input field after sending the message.
        document.getElementById('dialog-input').value = ''
    }
}