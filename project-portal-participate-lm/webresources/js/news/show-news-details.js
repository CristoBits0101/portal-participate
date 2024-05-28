// Function to display news details including contacts and addresses.
const newsDetails = (newsContacts, newsAddresses) =>
{
    // Clear the content of the <div>.
    const showDetailsDiv = document.getElementById("show-details")
    showDetailsDiv.innerHTML = ""

    // Show the div.
    showDetailsDiv.style.zIndex = "9999"
    showDetailsDiv.style.position = "fixed"
    showDetailsDiv.style.visibility = "visible"

    document.body.classList.add("hide-scrollbar")
    document.body.classList.add("hide-window-scrollbar")

    // Create the button container.
    const containerButton = document.createElement("div")
    containerButton.classList.add("container-button")

    // Create the hide button.
    const hideButton = document.createElement("button")
    hideButton.textContent = "✖️"
    hideButton.classList.add("hideNewsDetails")
    hideButton.onclick = hideNewsDetails
    containerButton.appendChild(hideButton)

    // Insert the containerButton as first child.
    showDetailsDiv.insertBefore(containerButton, showDetailsDiv.firstChild)

    // Create a single section for both contacts and addresses.
    const combinedSection = document.createElement("section")
    combinedSection.classList.add("combined-section")

    // Iterate through the contacts array.
    let counter = 1

    newsContacts.forEach(contact => 
    {
        // Create HTML elements for the contact.
        const contactArticle = document.createElement("article")
        const contactH2 = document.createElement("h2")
        const name = document.createElement("p")
        const contactEmail = document.createElement("p")
        const contactMobileNumber = document.createElement("p")

        // Set the content of the elements.
        contactH2.textContent = `Contact ${counter}`
        name.textContent = `😊 ${contact.firstName} ${contact.familyName}`
        contactEmail.textContent = `📩 ${contact.email}`
        contactMobileNumber.textContent = `📞 +${contact.mobileNumber} ${contact.phoneNumber}`

        // Append elements to the contact article.
        contactArticle.appendChild(contactH2)
        contactArticle.appendChild(name)
        contactArticle.appendChild(contactEmail)
        contactArticle.appendChild(contactMobileNumber)

        // Add the contact article to the combined section.
        combinedSection.appendChild(contactArticle)

        // Increment the counter.
        counter++
    })

    // Iterate through the addresses array.
    newsAddresses.forEach(address => 
    {
        // Create HTML elements for the address.
        const addressArticle = document.createElement("article")
        const addressH2 = document.createElement("h2")
        const addressStreet = document.createElement("p")
        const addressProvince = document.createElement("p")
        const addressPostalCode = document.createElement("p")
        const addressCountry = document.createElement("p")

        // Set the content of the elements.
        addressH2.textContent = `Address ${counter}`
        addressStreet.textContent = `📌 ${address.street}`
        addressProvince.textContent = `✈️ ${address.province}`
        addressPostalCode.textContent = `📫 ${address.postalCode}`
        addressCountry.textContent = `🚩 ${address.country}`

        // Append elements to the address article.
        addressArticle.appendChild(addressH2)
        addressArticle.appendChild(addressStreet)
        addressArticle.appendChild(addressPostalCode)
        addressArticle.appendChild(addressProvince)
        addressArticle.appendChild(addressCountry)

        // Add the address article to the combined section.
        combinedSection.appendChild(addressArticle)

        // Increment the counter.
        counter++
    })

    // Add the combined section to the showDetailsDiv.
    showDetailsDiv.appendChild(combinedSection)
}