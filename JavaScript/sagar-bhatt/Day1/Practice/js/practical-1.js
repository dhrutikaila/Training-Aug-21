document.body.onload = () => {
  // ? Accept three numbers from the user using prompt, find the greater of these the numbers and do the sum of that numbers which are greater than 40.
  let firstNo = parseInt(prompt("Enter first number"));
  let secondNo = parseInt(prompt("Enter second number"));
  let thirdNo = parseInt(prompt("Enter third number"));
  let sum = 0;

  let message1 = document.querySelector("#message1");
  let message2 = document.querySelector("#message2");

  if ((firstNo > secondNo) & (firstNo > thirdNo))
    message1.innerHTML = `<strong>First No (${firstNo}) is greater.</strong>`;
  else if ((secondNo > firstNo) & (secondNo > thirdNo))
    message1.innerHTML = `<strong>Second No (${secondNo}) is greater.</strong>`;
  else
    message1.innerHTML = `<strong>Third No (${thirdNo}) is greater.</strong>`;

  if (firstNo > 40) sum += firstNo;
  if (secondNo > 40) sum += secondNo;
  if (thirdNo > 40) sum += thirdNo;
  message2.innerHTML = `Sum of that numbers which are greater than 40: ${sum}`;
};
