import { createRestaurants } from '../Data';
import { Table } from '../Table/table';

interface IRestaurant {
  Id: number;
  address: string;
  city: string;
  state: string;
  name: string;
  contactNumber: number | string;
  tables: Array<Table>;
  setTables(Table: Table): void;
}

class Restaurant implements IRestaurant {
  static prevId: number = 0;
  Id: number;
  address: string;
  city: string;
  state: string;
  name: string;
  contactNumber: number | string;
  tables: Array<Table> = [];

  constructor(
    address: string,
    city: string,
    state: string,
    name: string,
    contactNumber: number | string
  ) {
    this.Id = ++Restaurant.prevId;
    this.address = address;
    this.city = city;
    this.state = state;
    this.name = name;
    this.contactNumber = contactNumber;

    restaurantsList.push(this);
  }

  setTables(Table: Table): void {
    this.tables.push(Table);
  }
}

//list of restaurant
var restaurantsList: Array<IRestaurant> = [];

//dummy restaurant creation

createRestaurants(
  'Near Iscon CrossRoad',
  'Ahmedabad',
  'Gujarat',
  'Palate Restaurant',
  9925099250
);

createRestaurants(
  'Naroda',
  'Ahmedabad',
  'Gujarat',
  'Emerald Restaurant',
  9925199251
);

createRestaurants(
  'Manipur',
  'Ahmedabad',
  'Gujarat',
  'Green Acres Restaurant',
  9925299252
);

createRestaurants(
  'Andheri',
  'Mumbai',
  'maharashtra',
  'royal Restaurant',
  9925499254
);

createRestaurants(
  'cannot palace',
  'new Delhi',
  'Delhi',
  'Swagat Restaurant',
  9925599255
);

export { IRestaurant, Restaurant, restaurantsList };
