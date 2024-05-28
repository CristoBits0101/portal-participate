// Function to serialize the onlineUsers array in the HTML component.
export const serializeOnlineUsers = (onlineUsers) => 
{
    // Get the HTML container where the users will be displayed.
    const onlineUserContainer = document.querySelector('.online-user-container')

    // Validation.
    if (onlineUserContainer) 
    {
        // Clear the container before adding users.
        onlineUserContainer.innerHTML = ''

        // Loop through each user in onlineUsers.
        onlineUsers.forEach(user => 
        {
            // Create a new <article> element for the user.
            const userArticle = document.createElement('article')
            userArticle.classList.add('online-user')

            // Create a new <figure> element for the user's image.
            const userFigure = document.createElement('figure')
            userFigure.classList.add('user-image')

            // Create a new <img> element for the user's image.
            const userImage = document.createElement('img')
            const currentPageURL = window.location.href.toLowerCase()
            const imageSrc = currentPageURL.includes('/magnoliaauthor') ? `/magnoliaAuthor/dam/jcr:bac422a1-8d46-456b-a199-9f3d0e7e0d40/id-facial.webp` : `/magnoliaPublic/dam/jcr:bac422a1-8d46-456b-a199-9f3d0e7e0d40/id-facial.webp`
            
            userImage.src = imageSrc
            userImage.alt = `${user.userName}'s profile picture`
            userImage.classList.add('settings')

            // Add the <img> element to the <figure>.
            userFigure.appendChild(userImage)

            // Add the <figure> element to the <article>.
            userArticle.appendChild(userFigure)

            // Create a new <section> element for the user details.
            const userDetails = document.createElement('section')
            userDetails.classList.add('user-details')

            // Create a new <h2> element for the user's name.
            const userNameHeading = document.createElement('h2')
            userNameHeading.textContent = user.userName
            userNameHeading.classList.add('user-name')

            // Add the <h2> element to the <section>.
            userDetails.appendChild(userNameHeading)

            // Create a new <p> element for the user's email.
            const userEmailParagraph = document.createElement('p')
            userEmailParagraph.textContent = user.userEmail
            userEmailParagraph.classList.add('user-email')

            // Add the <p> element to the <section>.
            userDetails.appendChild(userEmailParagraph)

            // Add the user details to the <article>.
            userArticle.appendChild(userDetails)

            // We create the button.
            const followButton = document.createElement('button')

            // We add the initial text according to the language of the page.
            followButton.textContent = currentPageURL.includes('/es') ? 'Seguir' : 'Follow'
            followButton.classList.add('follow-button')

            // By executing the onclick event on the button we replace the text depending on the language of the page.
            followButton.addEventListener('click', () => 
            {
                if (followButton.textContent === 'Follow' || followButton.textContent === 'Seguir')
                    followButton.textContent = currentPageURL.includes('/es') ? 'Siguiendo' : 'Following'
                else
                    followButton.textContent = currentPageURL.includes('/es') ? 'Seguir' : 'Follow'
            })

            // Add the follow button to the <article>.
            userArticle.appendChild(followButton)

            // Add the new <article> element to the user container.
            onlineUserContainer.appendChild(userArticle)
        })
    }
}