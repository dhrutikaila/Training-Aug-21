import { customer } from '../Customer/customer';
import { IRestaurant, Restaurant } from '../Restaurants/restaurant';
import { Table } from '../Table/table';

interface IReservation {
  Id: number;
  restaurant: Restaurant;
  GuestNumbers: number;
  reservationDateTime: Date;
  reservationDeliveryDateTime: Date;
  customer: customer;
  table: Table;
}

class reservation implements IReservation {
  static prevId = 0;
  Id: number;
  restaurant: Restaurant;
  GuestNumbers: number;
  reservationDateTime: Date;
  reservationDeliveryDateTime: Date;
  customer: customer;
  table: Table;

  constructor(
    restaurants: IRestaurant,
    GuestNumbers: number,
    reservationDeliveryDateTime: Date,
    customer: customer,
    table: Table
  ) {
    this.Id = ++reservation.prevId;
    this.restaurant = restaurants;
    this.GuestNumbers = GuestNumbers;
    this.reservationDateTime = new Date();
    this.reservationDeliveryDateTime = reservationDeliveryDateTime;
    this.customer = customer;
    this.table = table;
  }
}

export { reservation };
