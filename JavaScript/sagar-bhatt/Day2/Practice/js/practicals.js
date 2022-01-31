document.body.onload = () => {
  // * Practical 1: Write a JavaScript function to check whether a string is blank or not.
  let practical1 = document.querySelector("#practical1");
  let txtString1 = document.querySelector("#txtString1");

  txtString1.onkeyup = () => {
    if (txtString1.value.match(/^[\s*]/)) {
      practical1.innerHTML = `Your entered string is blank`;
    } else {
      practical1.innerHTML = `You have entered ${txtString1.value.length} characters.`;
    }
  };

  // * Practical 2: Write a JavaScript function to split a string and convert it into an array of words.
  let practical2 = document.querySelector("#practical2");
  let txtString2 = document.querySelector("#txtString2");

  txtString2.onkeyup = () => {
    practical2.innerHTML = `Array of words: [${txtString2.value.split(" ")}]`;
  };

  // * Practical 3: Write a JavaScript function to extract a specified number of characters from a string.
  let practical3 = document.querySelector("#practical3");
  let txtString3 = document.querySelector("#txtString3");

  txtString3.onkeyup = () => {
    str = txtString3.value.split(",");
    practical3.innerHTML = `Extracted String: [${str[0].substr(
      str[1],
      str[2]
    )}]`;
  };

  // * Practical 4: Write a JavaScript function to get the current date.
  let practical4 = document.querySelector("#practical4");
  let btnDate = document.querySelector("#btnDate");

  let getCurrDate = () => {
    practical4.innerHTML = `<div class="alert alert-dismissible bg-warning bg-opacity-25">
                              ${new Date().toDateString()}
                              <button class="btn-close" data-bs-dismiss="alert"></button>
                            </div>`;
  };

  btnDate.onclick = getCurrDate;

  // * Practical 5: Try some operation with list like push, pop, shifting, deleting element.
  let practical5 = document.querySelector("#practical5");
  let txtString5 = document.querySelector("#txtString5");

  txtString5.onkeyup = () => {
    arr = txtString5.value.split(",");

    practical5.innerHTML = `Your array is: [${arr}]<br />
    Last Item(pop): [${arr.pop()}]<br />
    First Item(shift): [${arr.shift()}]<br />
    New array after deletion: [${arr}]<br />`;
    arr.push(10, 20);
    arr.unshift(10, 20);
  };
};
