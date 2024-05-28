// Select the first fieldset element on the webpage.
let fieldset = document.querySelector('fieldset')

// If the fieldset is different from undefined, null, false and 0.
if (fieldset)
{
  // Create a new button element.
  let button = document.createElement('button')

  // Create a new div element to act as a wrapper for the SVG icon (likely styled by the class).
  let svgWrapper1 = document.createElement('div')

  // Create another new div element to act as a container for the SVG itself (likely styled by the class).
  let svgWrapper = document.createElement('div')

  // Create a new span element to hold the button text label.
  let span = document.createElement('span')

  // Set the button type to 'submit' to submit the associated form on click.
  button.type = 'submit'

  // Set a custom attribute 'wfd-id' with the value 'id8' on the button element (likely for a design system).
  button.setAttribute('wfd-id', 'id8')

  // Add the class 'svg-wrapper-1' to style the wrapper for the SVG icon.
  svgWrapper1.classList.add('svg-wrapper-1')

  // Add the class 'svg-wrapper' to style the container for the SVG itself.
  svgWrapper.classList.add('svg-wrapper')

  // Define the SVG code for an icon as a string.
  let svgString = `
    <svg height="24" width="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
      <path d="M0 0h24v24H0z" fill="none"></path>
      <path d="M1.946 9.315c-.522-.174-.527-.455.01-.634l19.087-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.455.547-.679.045L12 14l6-8-8 6-8.054-2.685z" fill="currentColor"></path>
    </svg>
  `

  // Set the innerHTML of the svgWrapper element to the SVG code string, effectively creating the icon.
  svgWrapper.innerHTML = svgString

  // Get current URL.
  var currentURL = window.location.href

  // Check if the URL contains the word es.
  if (currentURL.includes("/es"))
      span.innerHTML = 'Enviar'
  else
      span.innerHTML = 'Send'

  // Append the svgWrapper element (containing the SVG icon) as a child of the svgWrapper1 element.
  svgWrapper1.appendChild(svgWrapper)

  // Append the svgWrapper1 element (containing the styled wrapper and SVG icon) as a child of the button element.
  button.appendChild(svgWrapper1)

  // Append the span element (containing the text label "Send") as a child of the button element.
  button.appendChild(span)

  // Finally, append the complete button element (with icon and text label) as a child of the fieldset element, adding it to the form.
  fieldset.appendChild(button)
}