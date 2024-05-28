 // Feature import.
import { onOpen } from '../events/onopen.js'
import { onClose } from '../events/onclose.js'
import { onMessage } from '../events/onmessage.js'

// Function to start a WebSocket connection.
export const startConnection = (socket, path) => 
{
    // Create a WebSocket instance based on browser support.
    socket =
    
        // Check if WebSocket is supported in the current browser.
        ('WebSocket' in window) ? new WebSocket(path)
        : 
        // Check if MozWebSocket (Firefox-specific) is supported in the current browser.
        ('MozWebSocket' in window) ? new MozWebSocket(path) // Use MozWebSocket if supported.
        : 
        // If neither WebSocket nor MozWebSocket is supported, throw an error.
        (() => { throw new Error('WebSocket is not supported by this browser.') })()

    onOpen(socket)    // Call the onOpen function to handle actions when the connection is opened.
    onMessage(socket) // Call the onMessage function to handle actions when a message is received.
    onClose(socket)   // Call the onClose function to handle actions when the connection is closed.
}