import { Restaurant } from './Restaurants/restaurant';
import { Table } from './Table/table';

//function adds table to a restaurant instances
function addTable(
  restaurant: Restaurant,
  capacity: number,
  tableNumber: number
) {
  for (var i = 0; i < tableNumber; i++) {
    restaurant.setTables(new Table(restaurant, capacity));
  }
}

//function create restaurant instance
function createRestaurants(
  address: string,
  city: string,
  state: string,
  name: string,
  contactNumber: number | string
) {
  var newRes = new Restaurant(address, city, state, name, contactNumber);
  addTable(newRes, 4, 6);
}



//creating 3 tables at Emerald Restaurant

export { createRestaurants, addTable };
