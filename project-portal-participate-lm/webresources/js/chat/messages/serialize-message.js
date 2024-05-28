// Methods to update connected users.
import { addUser } from '../online/add-user.js'
import { deleteUser } from '../online/delete-user.js'

// Function to serialize and display a chat message.
export const serializeMessage = (message) => 
{
    // Get the chat console container element.
    let consoleElement = document.getElementById('chat-console-container')

    if (consoleElement) 
    {
        // Create a new paragraph element.
        let p = document.createElement('p')

        // Check if the message contains both 'linebreak' and 'userTime'.
        if (message.includes('linebreak') && message.includes('userTime')) 
        {
            // Split the message into userTime and content.
            const [userTime, content] = message.split('linebreak')
            const [user, time] = userTime.split('userTime')
            const contentLines = content.split('\n')

            // Function to capitalize the first letter of a string.
            const capitalizeFirstLetter = (formatUserName) => {
                return formatUserName.charAt(0).toUpperCase() + formatUserName.slice(1)
            }

            // Create a bold element for the user name.
            let userBold = document.createElement('b')
            let userText = document.createTextNode(capitalizeFirstLetter(user) + ' ')
            userBold.appendChild(userText)

            // Create text nodes for time and content.
            let timeText = document.createTextNode(time)

            // Check if userText and timeText are not empty.
            if (userText.textContent.trim() !== "" && timeText.textContent.trim() !== "") 
            {
                // Create a span element for the time.
                let span = document.createElement('span')
                span.classList.add('subtext')
                span.appendChild(timeText)

                // Append userBold, span, and a line break to the paragraph.
                p.appendChild(userBold)
                p.appendChild(span)
                p.appendChild(document.createElement('br'))
            }

            let fragment = document.createDocumentFragment()

            contentLines.forEach((line, index) => {
                if (index !== 0 && line.trim() === '')
                    return
                if (index !== 0)
                    fragment.appendChild(document.createElement('br'))
                fragment.appendChild(document.createTextNode(line))
            })

            p.appendChild(fragment)

            // Append the paragraph and a line break to the console container.
            consoleElement.appendChild(p)
            consoleElement.appendChild(document.createElement('br'))

            // Automatically scroll to the bottom of the chat console.
            consoleElement.scrollTop = consoleElement.scrollHeight
        }

        // If the message doesn't contain 'linebreak' and 'userTime'.
        else 
        {
            // Create a bold element for the message.
            let boldTextNode = document.createElement('b')

            // Get the browser URL and convert the string to lowercase.
            let newText = ''

            // 
            let copyMessage = message

            // Check if the message includes connected.
            if (copyMessage.includes("connected")) 
            {
                // Split the message by the intervening white spaces.
                const messageParts = copyMessage.trim().split(/\s+/)

                // Get the username and email.
                const userName = messageParts[0]
                const userEmail = messageParts[1]

                // Call addUser with the username and email.
                addUser(userName, userEmail)
            }

            else if (copyMessage.includes("disconnected")) 
            {
                // Split the message by the intervening white spaces.
                const messageParts = copyMessage.trim().split(/\s+/)

                // Get the username and email.
                const userEmail = messageParts[1]

                // Call deleteUser with the email.
                deleteUser(userEmail)
            }

            // In case the url is in Spanish check if the message includes 'connected' or 'disconnected'.
            if (window.location.href.toLowerCase().includes("/es"))
                newText = message.replace(/(\S+)\s+(\S+@\S+)\s+connected/g, "$1 se ha conectado 😎").replace(/(\S+)\s+(\S+@\S+)\s+disconnected/g, "$1 se ha desconectado 💀")

            // In case the url is not in Spanish check if the message includes 'connected' or 'disconnected'.
            else
                newText = message.replace(/(\S+)\s+(\S+@\S+)\s+connected/g, "$1 has connected 😎").replace(/(\S+)\s+(\S+@\S+)\s+disconnected/g, "$1 has disconnected 💀")

            // Crear un nuevo nodo de texto con el mensaje modificado.
            let textNode = document.createTextNode(newText)

            boldTextNode.appendChild(textNode)

            // Append the bold element to the paragraph.
            p.appendChild(boldTextNode)

            // Append the paragraph and a line break to the console container.
            consoleElement.appendChild(p)
            consoleElement.appendChild(document.createElement('br'))
        }
    }
}