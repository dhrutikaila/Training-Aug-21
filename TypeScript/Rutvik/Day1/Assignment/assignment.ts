var employees: Array<any> = [
  {
    ID: 1,
    FirstName: "Rutvik",
    LastName: "Kalasha",
    Address: "A-101,BhaktiNagar Residency, Bhambhan Road, Botad, Gujarat ",
    Salary: 20000
},
{
    ID: 2,
    FirstName: "Tarak",
    LastName: "Gopani",
    Address: "C-102,Sarjan Residency,Haridarshan Road, Surat, Gujarat",
    Salary: 30000
},
{
    ID: 3,
    FirstName: "Ankit",
    LastName: "Patel",
    Address: "B-202,Sarjan Residency,Mota Varacha, Surat, Gujarat",
    Salary: 40000
},
{
    ID: 4,
    FirstName: "Nilesh",
    LastName: "Tak",
    Address: "D-403,Urmi Residency, Mota Varacha, Surat, Gujarat",
    Salary: 50000
},
{
    ID: 5,
    FirstName: "Vivek",
    LastName: "Sakaliya",
    Address: "B-102, Navjivan Residancy, Bhambhan Road, Botad, Gujarat",
    Salary: 60000
},
];

/* 1 Inserting employee

    var emp1 = {
      ID: 6,
      FirstName: "Nayan",
      LastName: "Kalasha",
      Address: "E-101,Sarjan Residency,Haridarshan Road, Surat, Gujarat",
      Salary: 70000,
    };

  employees.push(emp1);
  console.log(employees);*/

/*2 Deleting employee data
    employees.pop();
    console.log(employees);*/

/*3. Searching Data Of Employee
      var newarray = employees.filter((val, index, array) => {
        return val.ID == 3;
      });
      console.log(newarray);*/

// Add Array

var emp2: Array<any> = [
  {
    ID: 51,
    FirstName: "Dipak",
    LastName: "Bhadiyadra",
    Address: "F-104, Navjivan Residancy, Bhambhan Road, Botad, Gujarat",
    Salary: 35000,
  },
  {
    ID: 52,
    FirstName: "Jigar",
    LastName: "Kalathiya",
    Address: "D-403,Urmi Residency, Mota Varacha, Surat, Gujarat",
    Salary: 45000,
  },
  {
    ID: 53,
    FirstName: "Maulik",
    LastName: "Kevadiya",
    Address: "E-502,Sarjan Residency,Mota Varacha, Surat, Gujarat",
    Salary: 55000,
  },
];

var newarray: Array<any> = employees.concat(emp2);
console.log(newarray);

for (var employee of newarray) {
  var pf: number = (employee.Salary)*(12/100);
  console.log("Employee Full Name: " + employee.FirstName + " " + employee.LastName);
  var arr: Array<any> = employee.Address.split(",");
  console.log("Flat Number: "+arr[0]);
  console.log("Apartment: "+arr[1]);
  console.log("Near: "+arr[2]);
  console.log("City: "+arr[3]);
  console.log("State: "+arr[4]);
  console.log("Salary: "+employee.Salary);
  console.log("Professional Tax: "+pf);
}