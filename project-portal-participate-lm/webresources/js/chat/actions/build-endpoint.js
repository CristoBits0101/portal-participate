// Function to build the WebSocket endpoint based on the current protocol and host.
export const buildEndpoint = () => 
{
    // Determine the protocol based on the current window location.
    const protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://'

    // Build the WebSocket endpoint by combining the protocol, host, and specific path.
    return protocol + window.location.host + `/websocket-service/community/chat?userName=${userName}&userEmail=${userEmail}`
}