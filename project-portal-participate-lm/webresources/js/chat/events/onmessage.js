// Function to send messages through the socket.
import { serializeMessage } from '../messages/serialize-message.js'

// Declaration of actions to take when a message is received through the socket.
export const onMessage = (socket) => 
{
    // When the 'onmessage' event occurs, the socket object invokes this anonymous function and passes the message as an argument.
    socket.onmessage = (message) => 
    {
        // Call the serializeMessage function with the data from the received message.
        serializeMessage(message.data)
    }
}