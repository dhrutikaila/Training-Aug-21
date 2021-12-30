import { Restaurant } from '../Restaurants/restaurant';

interface ICustomer {
  Id: number;
  firstName: string;
  lastName: string;
  contactNumber: string | number;
  city: string;
}

class customer implements ICustomer {
  static prevId = 0;
  Id: number;
  firstName: string;
  lastName: string;
  contactNumber: string | number;
  city: string;

  constructor(
    firstName: string,
    lastName: string,
    contactNumber: string | number,
    city: string
  ) {
    this.Id = ++customer.prevId;
    this.firstName = firstName;
    this.lastName = lastName;
    this.contactNumber = contactNumber;
    this.city = city;
  }

  // getRestraunts() {
  //   let restaurants: Array<Restaurant>;

  //   for(var restaurant in restaurants){
  //     if()
  //   }
  // }
}

export { customer };
