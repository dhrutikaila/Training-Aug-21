// Import stylesheets
import { customer } from './Customer/customer';
import { createRestaurants } from './Data';
import { reservation } from './Reservation/reservation';
import {
  IRestaurant,
  Restaurant,
  restaurantsList,
} from './Restaurants/restaurant';

import './style.css';
import { Table } from './Table/table';

// Write TypeScript code!
const appDiv: HTMLElement = document.getElementById('app');
appDiv.innerHTML = `<h1>TypeScript Test</h1>`;

/* 
Online table reservation in the restaurant for specific date and time. This will
	->Provide the list of restaurants in the country so that the user can choose accordingly.
	->Provide the list of tables available for online reservation at different dining rooms in the restaurant.
	->Mention the number of guests that can be accommodated on the particular table.
	->Accept the booking for tables.
	->Online table reservations are done 6hrs in advance for the current date.
	->Table reservation can be done up to one month in advance.
	->Give a token number to the customer as an acknowledgement of booking.
	
*/

//test project

let loop = false;
//Welcome message
console.log('Welcome to the Online Restaurant reservation ');

//taking customer info

console.log('hello new customer enter your good name, and number');

let newcustomer = new customer('Raviraj', 'Padhiyar', 9265914306, 'Ahmedabad');

console.log(
  `Thank you ${newcustomer.firstName} registering with online restaurants reservation system`
);

//------------------------------------------------------------
//Provide the list of restaurants in the country so that the user can choose accordingly.

console.log(
  `Hello ${newcustomer.firstName} these are the available restaurants in your current city`
);

console.log(restaurantsList);

console.log(restaurantsList.filter((res) => res.city == newcustomer.city));

//---------------------------------------------------------------
console.log('Enter restrat id for booking a table at reastaraunt');

//suppose user enter reastaraunt with id 2;

let resId = 2;
let preferedRes = restaurantsList.filter((res) => res.Id == resId)[0];

console.log(
  `You have choose ${preferedRes.name} which is situated at ${preferedRes.address} in city ${preferedRes.city}`
);

//table available
console.log(
  `there are ${
    preferedRes.tables.filter((table) => table.vacant).length
  } tables availabe at the ${preferedRes.name}}`
);

//Mention the number of guests that can be accommodated on the particular table.

console.log(
  `${preferedRes.name} can accommodate ${preferedRes.tables[0].capacity} guest on each tables`
);

//booking tables
//Online table reservations are done 6hrs in advance for the current date.
// Table reservation can be done up to one month in advance.

function makeResrvation(
  restaurants: IRestaurant,
  GuestNumbers: number,
  reservationDeliveryDateTime: Date,
  customer: customer,
  table: Table
) {
  var UC = new Date();
  UC.setHours(UC.getHours() + 6);

  var LC = new Date();
  LC.setMonth(LC.getMonth() - 1);

  if (reservationDeliveryDateTime < UC && reservationDeliveryDateTime > LC) {
    let newReservation = new reservation(
      preferedRes,
      4,
      new Date('2021-11-29 20:30:00'),
      newcustomer,
      preferedRes.tables.find((t) => t.Id == 2)
    );

    console.log(
      `${newcustomer.firstName} your requested has been granted and new Reservation has been reserved with reservation Id ${newReservation.Id} in ${newReservation.restaurant.name} at time ${newReservation.reservationDeliveryDateTime}`
    );
  } else console.log('sorry u either hit UC or LC of time limit');
}

makeResrvation(
  preferedRes,
  4,
  new Date('2021-11-29 20:30:00'),
  newcustomer,
  preferedRes.tables.find((t) => t.Id == 2)
);

//Give a token number to the customer as an acknowledgement of booking.

class Guid {
  static newGuid() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(
      /[xy]/g,
      function (c) {
        var r = (Math.random() * 16) | 0,
          v = c == 'x' ? r : (r & 0x3) | 0x8;
        return v.toString(16);
      }
    );
  }
}

var reservationListTokesn = new Map<number, string>();
reservationListTokesn.set(newcustomer.Id, Guid.newGuid());
