// Function to serialize online users.
import {serializeOnlineUsers} from './serialize-users.js'

// Remove the disconnecting user from the list.
export const deleteUser = (userEmail = '') => 
{
    // Check if the user is online.
    const index = onlineUsers.findIndex(user => user.userEmail === userEmail)

    // If the user is online, remove him.
    if (index !== -1)
        onlineUsers.splice(index, 1)

    serializeOnlineUsers(onlineUsers)
}