import { Restaurant } from '../Restaurants/restaurant';

interface ITable {
  Id: number;
  restaurant: Restaurant;
  capacity: number;
  vacant: boolean;
  reserved: boolean;
}

class Table implements ITable {
  static prevId = 0;
  Id: number;
  restaurant: Restaurant;
  capacity: number;
  vacant: boolean;
  reserved: boolean;

  constructor(restaurant: Restaurant, capacity: number) {
    this.Id = ++Table.prevId;
    this.restaurant = restaurant;
    this.capacity = capacity;
    this.vacant = true;
    this.reserved = false;
  }
}

export { Table };
