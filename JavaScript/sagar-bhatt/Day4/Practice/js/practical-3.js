// * Practical 3: Make a function that takes in a single parameter and returns a new promise. using setTimeout, after 500 milliseconds, the promise will either resolve or reject. if the input is a string, the promise resolves with that reverse string . if the input is anything but a string it rejects with that same input call the function wrong Input.

function wrongInput(value) {
  console.log(value);
}

function stringReverse(str) {
  return new Promise((resolve, reject) => {
    if (typeof str == "string") {
      let strReverse = "";
      for (let i = str.length - 1; i >= 0; i--) {
        strReverse += str[i];
      }
      setTimeout(() => resolve(strReverse), 1000);
    } else {
      reject("Oops! Wrong Input. Please Enter string value.");
    }
  });
}

async function syncStringReverse() {
  let result = await stringReverse("sagar");
  console.log(result);
}
syncStringReverse().catch((value) => wrongInput(value));
