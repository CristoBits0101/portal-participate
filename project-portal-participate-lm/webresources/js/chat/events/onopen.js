// Function to send messages through the socket.
import {sendMessage} from '../messages/send-message.js'

// Declaration of what I want to happen when there is a socket connection.
export const onOpen = (socket) => 
{
    // This event is fired when the socket connection is opened.
    socket.onopen = () => 
    {
        /**
         * This event is fired when a key is pressed on the element.
         * The parameter is provided by the web browser when the event is fired.
         * The parameter contains information about the event that occurred, such as the key that was pressed and any other relevant information.
         */
        
        let dialogInput = document.getElementById('dialog-input')

        if (dialogInput) 
        {
            dialogInput.onkeydown = (event) => 
            {
                // Call the sendMessage function with the socket instance.
                if (event.key === 'Enter' && !event.shiftKey)
                    sendMessage(socket)
            }
        }
    }
}