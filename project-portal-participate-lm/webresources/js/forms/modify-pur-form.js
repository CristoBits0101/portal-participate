// Reference to all the elements that the .form-row class has within a fieldset.
let classElements = document.querySelectorAll('fieldset .form-row')

// Loop through the set of references.
classElements.forEach(classElement => {

    // Select the elements that are inside the div.
    let input = classElement.querySelector('input')
    let label = classElement.querySelector('label')

    // Create span elements.
    let span1 = document.createElement("span")
    span1.className = "highlight"

    let span2 = document.createElement("span")
    span2.className = "bar"

    // Modify element classes.
    classElement.classList.add('group')
    input.classList.add('input')

    // Add the elements in the specified order.
    classElement.appendChild(input)
    classElement.appendChild(span1)
    classElement.appendChild(span2)
    classElement.appendChild(label)
    
})