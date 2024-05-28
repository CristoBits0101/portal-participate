// Function to go to the previous page.
const goToPreviousPage = () => {
    if (previousPage > 0) {
        previousPage -= 1
        currentPage -= 1
        nextPage -= 1
    }
    updatePage()
}

// Function to go to the next page.
const goToNextPage = (amountContentDisplay) => {
    if (nextPage < amountContentDisplay) {
        previousPage += 1
        currentPage += 1
        nextPage += 1
    }
    updatePage()
}

// Update the UI and save new values to localStorage.
const updatePage = () => {
    let goToPreviousPageButton = document.getElementById("goToPreviousPage")
    goToPreviousPageButton.textContent = previousPage

    let currentPageContainer = document.getElementById("currentPageContainer")
    currentPageContainer.textContent = currentPage

    let goToNextPageButton = document.getElementById("goToNextPage")
    goToNextPageButton.textContent = nextPage

    // Save current values to localStorage
    localStorage.setItem('previousPage', previousPage)
    localStorage.setItem('currentPage', currentPage)
    localStorage.setItem('nextPage', nextPage)

    // Reload the page.
    window.location.reload()
}

// Function to reset navigation state.
const reset = () => {
    localStorage.removeItem('previousPage')
    localStorage.removeItem('currentPage')
    localStorage.removeItem('nextPage')
    alert('Reset')
}

document.addEventListener('DOMContentLoaded', function() {
    let previous = document.getElementById("goToPreviousPage")
    previous.textContent = previousPage

    let actual = document.getElementById("currentPageContainer")
    actual.textContent = currentPage

    let next = document.getElementById("goToNextPage")
    next.textContent = nextPage
})