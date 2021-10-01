// Use Window.location object to navigate on another page

const btn1 = document.getElementById("mv-to-index");

btn1.addEventListener("click", () => {
    window.location.href = "http://localhost:5500/Practice/";
})




// Use Window.history object to move to previous url in the history list

const moveF = document.getElementById("move-forward");
const moveB = document.getElementById("move-back");

moveF.addEventListener("click", () => {
    window.history.forward();
})
moveB.addEventListener("click", () => {
    window.history.back();
})


// Try to change windows height and width using Windows object

const resizeWindow = document.getElementById("resizeWindow");


resizeWindow.addEventListener("click", () => {
    myWindow = window.open(window.location.href, "", "width=300", "height=300");
    myWindow.resizeBy(550, 550);
})