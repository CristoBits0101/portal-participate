// Function to serialize online users.
import { serializeOnlineUsers } from './serialize-users.js';

// Store users online.
var onlineUsers = []

// Add the connecting user to the list.
export const addUser = (userName = '', userEmail = '') => 
{
    // Check if the user is already online.
    const userExists = onlineUsers.some(user => user.userName === userName)

    // If the user is not online, add him.
    if (!userExists)
        onlineUsers.push({ userName, userEmail })

    serializeOnlineUsers(onlineUsers)
}