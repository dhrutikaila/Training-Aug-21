async function f() {

  let promise = new Promise((resolve, reject) => {
    setTimeout(() => resolve("done!"), 1000)
  });

  let result = await promise; // wait until the promise resolves (*)

  alert(result); // "done!"
}

f();



//sequential
async function sequence() {
    await Promise1(50);
    await Promise2(50);
    return "done!!"
}
console.log(sequence());


//this is just an example for calling multiple promises and calling all at a time
async function selectPizza() {
  const pizzaData = await getPizzaData()    // async call
  const chosenPizza = choosePizza()    // sync call
  await addPizzaToCart(chosenPizza)    // async call
}

async function selectDrink() {
  const drinkData = await getDrinkData()    // async call
  const chosenDrink = chooseDrink()    // sync call
  await addDrinkToCart(chosenDrink)    // async call
}

Promise.all([selectPizza(), selectDrink()]).then(orderItems)   // async call

async function orderItems() {
  const items = await getCartItems()    // async call
  const promises = items.map((item) => sendRequest(item))
  await Promise.all(promises)    // async call
}

