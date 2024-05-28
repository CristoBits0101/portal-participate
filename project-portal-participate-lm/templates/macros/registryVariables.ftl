<script>

    // Initialize variables with values from localStorage or default values.
    var previousPage = localStorage.getItem('previousPage') || "0"
    previousPage = parseInt(previousPage, 10)

    var currentPage = localStorage.getItem('currentPage') || "1"
    currentPage = parseInt(currentPage, 10)

    var nextPage = localStorage.getItem('nextPage') || "2"
    nextPage = parseInt(nextPage, 10)

    // Gets the username.
    var userName = '${ctx.user.name}'

    // Get the user's email.
    if (userName && userName.toLowerCase() !== 'anonymous')
        var email = '${ctx.user.email}'
    if (email)
        var userEmail = '${ctx.user.email}'
    else
        var userEmail = '${i18n['private.email']}'

    // Get the current URL and 
    var urlActual = window.location.href

    var previousValue = localStorage.getItem('previousValue') || "0"
    previousValue = parseInt(previousValue, 10)

    // localStorage.removeItem('previousValue')

    // Checks if the URL already contains the previousPage parameter.
    /* 
        if (!urlActual.includes('previousPage=') || previousValue !== previousPage) {
            urlActual += (urlActual.indexOf('?') !== -1) ? "&previousPage=" + previousPage : "?previousPage=" + previousPage
            localStorage.setItem('previousValue', previousPage)
            window.location.href = urlActual
        }
    */

</script>