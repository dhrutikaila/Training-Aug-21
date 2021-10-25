// TODO: https://www.w3schools.com/js/js_window.asp
// * JavaScript Window Object - The Browser Object Model
// The window object is supported by all browsers. It represents the browser's window.
// Global variables are properties of the window object.Global functions are methods of the window object.
// Even the document object (of the HTML DOM) is a property of the window object:
//   The window.screen object contains information about the user's screen.
document.write(
  `
  Browser inner window width: ${window.innerWidth} <br />
  Browser inner window height: ${window.innerHeight} <br />
  Screen Width: ${screen.width} <br />
  Screen Height: ${screen.height} <br />
  Available Screen Width: ${screen.availWidth} <br />
  Available Screen Height: ${screen.availHeight} <br />
  Screen Color Depth: ${screen.colorDepth} <br />
  Screen Pixel Depth: ${screen.pixelDepth} <br />
  <br />
  `
);

// * Other Window Methods
// Some other methods:
// ? window.open() - open a new window
document.body.onload = () => {
  window.open(
    "https://www.w3schools.com",
    "_blank",
    "top=500,left=500,width=400,height=400"
  );
  // var myWindow = window.open("", "myWindow", "width=200,height=100");
  // myWindow.document.write("<p>This is 'myWindow'</p>");
  // myWindow.opener.document.write("<p>This is the source window!</p>");
};
// ? window.close() - close the current window
// ? window.moveTo() - move the current window
// ? window.resizeTo() - resize the current window

// * JavaScript Window Location
// The window.location object can be used to get the current page address (URL) and to redirect the browser to a new page.
document.write(
  `
  window.location.href returns the href (URL) of the current page: <br />
  ${window.location.href} <br />
  window.location.hostname returns the domain name of the web host: <br />
  hostname:${
    window.location.hostname + "<br />host:" + window.location.host
  } <br />
  window.location.pathname returns the path and filename of the current page: <br />
  ${window.location.pathname} <br />
  window.location.protocol returns the web protocol used (http: or https:): <br />
  ${window.location.protocol} <br /><br />
  `
);

// * window.location.assign() loads a new document
// window.location.assign("https:google.com");

// * JavaScript Window History
// The window.history object contains the browsers history.
// ? history.back() - same as clicking back in the browser
// ? history.forward() - same as clicking forward in the browser

let historyBack = document.createElement("button");
let historyBackText = document.createTextNode("History Back");
let historyForward = document.createElement("button");
let historyForwardText = document.createTextNode("History Forward");
historyBack.appendChild(historyBackText);
historyForward.appendChild(historyForwardText);

let firstChild = document.body.firstChild;
document.body.insertBefore(historyBack, firstChild);
document.body.insertBefore(historyForward, firstChild);

historyBack.addEventListener("click", () => {
  window.history.back();
});
historyForward.addEventListener("click", () => {
  window.history.forward();
});

// * JavaScript Window Navigator
// The window.navigator object contains information about the visitor's browser.
document.write(
  `
  The cookieEnabled property returns true if cookies are enabled, otherwise false: <br />
  ${navigator.cookieEnabled} <br />
  vendor: ${navigator.vendor} <br />
  userAgent: ${navigator.userAgent} <br />
  language: ${navigator.language} <br />
  onLine: ${navigator.onLine} <br />
  `
);

// * Timing Events
// The window object allows execution of code at specified time intervals.These time intervals are called timing events.
// The two key methods to use with JavaScript are:
// setTimeout(function, milliseconds): Executes a function, after waiting a specified number of milliseconds.
// setInterval(function, milliseconds): Same as setTimeout(), but repeats the execution of the function continuously.

// * How to Stop the Execution?
// ? The clearTimeout() method stops the execution of the function specified in setTimeout().
// ? The clearInterval() method stops the executions of the function specified in the setInterval() method.

var sTimeout = setTimeout(() => {
  document.body.appendChild(
    document.createElement("p").appendChild(document.createTextNode(new Date()))
  );
}, 1000);

let btnStart = document.createElement("button");
let btnStartText = document.createTextNode("Start Clock");
let btnStop = document.createElement("button");
let btnStopText = document.createTextNode("Stop Clock");
btnStart.appendChild(btnStartText);
btnStop.appendChild(btnStopText);
let lastChild = document.body.lastChild;
document.body.appendChild(btnStart, firstChild);
document.body.appendChild(btnStop, firstChild);

let sInterval;
btnStart.onclick = () => {
  sInterval = setInterval(() => {
    document.body.replaceChild(
      document.createTextNode(new Date()),
      document.body.lastChild
    );
  }, 1000);
};

btnStop.onclick = () => {
  clearInterval(sInterval);
};

// Bootstrap Styles:
document.body.classList.add("font-monospace", "p-3", "bg-light");
document.querySelectorAll("h1")[0].className = "text-danger";
btnStart.className = "btn btn-outline-danger";
btnStop.className = "btn btn-outline-danger";
historyBack.className = "btn btn-outline-dark";
historyForward.className = "btn btn-outline-dark";
