// Define a function named mymemory that translates a word from originLanguage to languageDestination using the MyMemory API.
const mymemory = (word, originLanguage, languageDestination) => 
{
    // Fetch translation data from the MyMemory API using the provided parameters.
    return fetch(`https://api.mymemory.translated.net/get?q=${word}&langpair=${originLanguage}|${languageDestination}`)

        // Parse the response as JSON.
        .then(response => response.json())
        .then(data => 
        {
            // Extract the translated text from the response data.
            const translation = data.responseData.translatedText
            return translation
        })

        .catch(error => 
        {
            // Log and throw an error if there's an issue with fetching the translation.
            console.error('Error getting translation: ', error)
            throw error
        })
}