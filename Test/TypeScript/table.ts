// Online table reservation for specific date & time, list of restaurants, number of available tables, guest count, booking can be done or not based on timing, token on successfull booking.

import { restaurants, restaurant, guests, guestss, booking, availability } from './Modules';

var r= new restaurant();
r.addRestaurants("TGB","Ahmedabad",0);
r.addRestaurants("Hariyali Thali","Vadodara",80);
r.addRestaurants("The Grand Thakar","Ahmedabad",50);

var g= new guests();
g.addGuests("Leo Messi",5,new Date);

var b = new booking();
b.booking();
console.log(1);

var a = new availability();
a.avail();
