window.onload = () => {
    setTimeout(() => {
        let bodyContent = document.querySelector('body')
        bodyContent.style.visibility = 'visible'
        bodyContent.style.backgroundImage = "radial-gradient(circle at 17% 77%, rgba(17, 17, 17, 0.04) 0%, rgba(17, 17, 17, 0.04) 50%, rgba(197, 197, 197, 0.04) 50%, rgba(197, 197, 197, 0.04) 100%), radial-gradient(circle at 26% 17%, rgba(64, 64, 64, 0.04) 0%, rgba(64, 64, 64, 0.04) 50%, rgba(244, 244, 244, 0.04) 50%, rgba(244, 244, 244, 0.04) 100%), radial-gradient(circle at 44% 60%, rgba(177, 177, 177, 0.04) 0%, rgba(177, 177, 177, 0.04) 50%, rgba(187, 187, 187, 0.04) 50%, rgba(187, 187, 187, 0.04) 100%), linear-gradient(19deg, rgb(28, 117, 250), rgb(34, 2, 159))"
    }, 1500)
}