import { modifyPost } from '../posts/modify-post.js'

let modifyForm = document.getElementById('modify-form')

if (modifyForm) 
{
    // Prevents the default action and executes the function that validates the form.
    modifyForm.addEventListener('submit', function (event) {
        event.preventDefault()
        validateUpdateForm(magnoliaInstance)
    })

    // Validate the publishing form.
    const validateUpdateForm = (magnoliaInstance) => 
    {
        // Gets the elements to be validated.
        const nameInput = document.getElementById('post-name')
        const titleInput = document.getElementById('post-title')
        const messageTextarea = document.getElementById('post-message')
        const postInput = document.getElementById('postId')

        // Control errors.
        const isValid = true

        // Validate the field and if not, indicate the error.
        if (nameInput.value.trim() === '' && nameInput.value) {
            const nameDiv = document.getElementsByClassName('post-name')
            const p = document.createElement('p')
            p.textContent = 'The name is wrong - El nombre esta mal.'
            p.style.color = 'red'
            nameDiv.appendChild(p)
            isValid = false
        }

        // Validate the field and if not, indicate the error.
        if (titleInput.value.trim() === '' && titleInput.value) {
            const titleDiv = document.getElementsByClassName('post-title')
            const p = document.createElement('p')
            p.textContent = 'The title is wrong - El title esta mal.'
            p.style.color = 'red'
            titleDiv.appendChild(p)
            isValid = false
        }

        // Validate the field and if not, indicate the error.
        if (messageTextarea.value.trim() === '' && titleInput.value != null && titleInput.value != undefined) {
            const messageDiv = document.getElementsByClassName('post-message')
            const p = document.createElement('p')
            p.textContent = 'The message is wrong, El message esta mal.'
            p.style.color = 'red'
            messageDiv.appendChild(p)
            isValid = false
        }

        // Validate the field and if not, indicate the error.
        if (postInput.value.trim() === '' && postInput.value) {
            const titleDiv = document.getElementsByClassName('post-title')
            const p = document.createElement('p')
            p.textContent = 'The title is wrong - El title esta mal.'
            p.style.color = 'red'
            titleDiv.appendChild(p)
            isValid = false
        }

        // If the validities are passed, the function that sends the data to the backend is called.
        if (isValid)
            storesDataJCR(magnoliaInstance, nameInput.value, titleInput.value, messageTextarea.value, postInput.value)
    }

    // Calls the fetch function that sends the data to the backend.
    const storesDataJCR = (magnoliaInstance, postAuthor, title, message, uuid) => {
        modifyPost(magnoliaInstance, postAuthor, title, message, uuid)
    }
}