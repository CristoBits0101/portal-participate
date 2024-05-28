// Function to send messages through the socket.
import { serializeMessage } from '../messages/serialize-message.js'

// Function to handle actions when the socket connection is closed.
export const onClose = (socket) => 
{
    // Event listener for when the socket connection is closed.
    socket.onclose = () => 
    {
        // Remove the 'onkeydown' event listener from the element with the ID 'dialog-input'.
        document.getElementById('dialog-input').onkeydown = null

        // Serialize an informational message indicating that the WebSocket has been closed.
        serializeMessage('Info: WebSocket closed.')
    }
}