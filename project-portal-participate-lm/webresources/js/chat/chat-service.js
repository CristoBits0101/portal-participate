// Feature import.
import { buildEndpoint } from './actions/build-endpoint.js'
import { startConnection } from './actions/start-connection.js'

// Store WebSocket instance.
let socket = null

// Initialize endpoint.
let path = buildEndpoint()

// Start connection.
try {

    // Check if 'path' is not null or empty.
    // If it's valid, start the connection by calling the 'startConnection' function with the WebSocket instance and the endpoint path.
    // Otherwise, throw an error.
    path ? startConnection(socket, path) : (() => { throw new Error('Path is null or empty.') })()

} catch (error) {

    // Catch and log any errors that occur during the connection setup.
    console.error(error.message)

}