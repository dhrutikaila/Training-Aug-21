//Store 5 Employee Data(ID,Name,City,DOJ) in one Array. Search the employee with ID.

//Search the employees who has joined after year 2020

//Search the employee who has joined after year 2020 and stays in Mumbai City



let Employee: any[]=[{ID:1,Name:"dhruti",City:"ahemdabad",DOJ:new Date(2019,11,2)},
{ ID: 2, Name: 'avni', City: 'Mumbai',DOJ:new Date(2019,11,2) },
{ ID: 3, Name: 'khushi', City: 'dheli', DOJ: new Date(2021,11,2) },
{ ID: 4, Name: 'gopi', City: 'maharastra', DOJ :new Date(2019,11,2)  },
{ ID: 5, Name: 'meena', City: 'gandhinagr', DOJ :new Date(2021,11,2) }
];

var id : number =1;
console.log(Employee[id-1]);

//Search the employees who has joined after year 2020
for(var items of Employee)
{
    if(items.DOJ.getFullYear() > 2020)
    {
        console.log(items);
    }
}


//Search the employee who has joined after year 2020 and stays in Mumbai city
for(var items of Employee)
{
    if((items.DOJ.getFullYear() > 2020) && (items.City.toUpperCase() == 'MUMBAI'))
    {
        console.log(items);
    }
}
