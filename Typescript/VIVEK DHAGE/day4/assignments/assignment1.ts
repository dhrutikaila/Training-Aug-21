
// Assignment

// Store 5 Employee Data(ID,Name,City,DOJ) in one Array. Search the employee with ID.

// Search the employees who has joined after year 2020

// Search the employee who has joined after year 2020 and stays in Mumbai city




let employee1:{ID:number, Name:string, City:string,Doj:Date}[] = [
    { "ID": 0, "Name": "sandeep", "City": "Mumbai", "Doj": new Date("2021-01-04")},
    { "ID": 1, "Name": "randeep", "City": "delhi", "Doj": new Date("2017-01-03")},
    { "ID": 2, "Name": "mandeep", "City": "pune", "Doj": new Date("2021-01-21")},
    { "ID": 3, "Name": "bhuvan", "City": "nagpur", "Doj": new Date("2021-01-03")},
    { "ID": 4, "Name": "raj", "City": "shrinagar", "Doj": new Date("2017-01-03")},
    { "ID": 5, "Name": "mayur", "City": "Mumbai", "Doj": new Date("2017-01-03")},
    { "ID": 6, "Name": "jatin", "City": "daman", "Doj": new Date("2018-01-03")},
    { "ID": 7, "Name": "shubham", "City": "Mumbai", "Doj": new Date("2019-01-05")}
  ];
  

  let SearchId = employee1.filter((element=> {
    return element.ID==1;
}));
  //Search the employee with ID.
  let SearchYear = employee1.filter((element=> {
      return element.Doj.getFullYear()>2020;
  }));
  let YearnCity = employee1.filter((element=> {
    return element.Doj.getFullYear()>2020 && element.City=="Mumbai";
}));

console.log("seach by id:");
  SearchId.forEach(element=>{
    console.log(`ID: ${element.ID} , Name is: ${element.Name}`)
});


console.log("seach by year 2020:");
SearchYear.forEach(element=>{
    console.log(`ID: ${element.ID}  , Name is: ${element.Name}`)
});

console.log("seach by year 2020 and mumbai:");
YearnCity.forEach(element=>{
    console.log(`ID: ${element.ID}  , Name is: ${element.Name}`)
});



//   // Search the employees who has joined after year 2020
  
//   // Search the employee who has joined after year 2020 and stays in Mumbai city
  
//   console.log("employees who joined after 2020 are:");
  
//   for (let i = 0; i < employee.length; i++) {
//     var dtd = new Date(employee[i].DOJ);
//     var constrainDate = new Date("2019-12-31");
//     var smallCity = employee[i].City;
//     smallCity.toLowerCase;
  
//     if (dtd > constrainDate) {
//       console.log(
//       `  ${employee[i].ID} ${employee[i].Name}`
//        ) }
  
//     // console.log(employee[i].City);
//   }
  
  
  
  
//   console.log("employees with location mumbai plus joined after 2020 are:");
  
//   for (let i = 0; i < employee.length; i++) {
//       var dtd = new Date(employee[i].DOJ);
//       var constrainDate = new Date("2019-12-31");
//       var smallCity = employee[i].City;
//       smallCity.toLowerCase;
    
//       if (smallCity == "mumbai" && dtd > constrainDate) {
//         console.log(
//           ` ${employee[i].ID} ${employee[i].Name}`
//         );
//       }
    
//       // console.log(employee[i].City);
//     }