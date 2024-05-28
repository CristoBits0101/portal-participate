// Make a request to delete a post from the JCR.
const destroyPost = (postUUID = null) =>                                            // magnoliaAuthor     || magnoliaPublic, jcr:283745 
{
    magnoliaInstance =                                                              // We modify the values if it is not what was expected.
        (magnoliaInstance === "/magnoliaauthor") ? "/magnoliaAuthor" :
        (magnoliaInstance === "/magnoliapublic") ? "/magnoliaPublic" :
         magnoliaInstance;

    const protocol = window.location.protocol + '//'                                // http://            || https://
    const host = window.location.host                                               // localhost:8080/    || https://www.ejemplo.com:8080/pagina/
    const context = magnoliaInstance + '/'                                          // magnoliaAuthor     || magnoliaPublic
    const endpoint = '.rest/posts/v1/'                                              // Java class @Path
    const method = 'destroy'                                                        // Class method @Path

    const url = `${protocol}${host}${context}${endpoint}${method}?uuid=${postUUID}` // http://localhost:8080/magnoliaInstance/.rest/posts/v1/destroy/

    fetch(url,
    {
        method: 'DELETE',                                                           // Specify the HTTP method of the request.
        headers:                                                                    // Setting up the header is good practice!
        {
            'Accept': 'application/json',                                           // Specify the type of data you expect in the response.
        },
    })
        .then(response => {                                                         // Handle the response from the server.
            if (response.ok)                                                        // Check if the response was successful.
                return response.json()                                              // Convert the response to JSON format.
            throw new Error('Network response was not ok.')                         // Throw an error if the response was not successful.
        })
        .then(data => {                                                             // Handle the data returned from the server.
            console.log(data)                                                       // Log the data to the console.
            alert('Success ✅');
            window.location.reload();                                               // Reload page.
        })
        .catch(error => {                                                           // Catch any errors that occurred during the process.
            console.error('Error deleting resource: ', error)                       // Log the error to the console.
            throw error                                                             // Throw the error again to handle it elsewhere if needed.
        })
}