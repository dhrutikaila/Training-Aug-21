import * as restaurantdata from './Exam'

console.log('\n')
console.log("============================================================================")
console.log("\t \t Restaurant Details")
console.log("============================================================================")
var res = restaurantdata.AddRestaurant(1 , "Bagh-one","Ahmedabad","Gujarat","India")  ;
restaurantdata.AddRestaurant(2 , "Shyam Village","Ahmedabad","Gujarat","India") ;
restaurantdata.GetRestaurant();

//var Ttype : string = restaurantdata.TableType['High Top table']

console.log('\n')
console.log("================================================================")
console.log("\t \t Table Details")
console.log("================================================================")
var table  = restaurantdata.Tabledata(1,1,2,'High Top table')
restaurantdata.Tabledata(1,3,2,'High Top table')
restaurantdata.GetTable();


console.log('\n')
console.log("==================================================================")
console.log("\t \t Customer Details")
console.log("==================================================================")
var cusdata = restaurantdata.AddCustomer( 1 , "Shreya" , "9870087829")
restaurantdata.GetCustomer();

