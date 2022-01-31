import { Component, OnInit } from '@angular/core';
import { FormGroup, NgForm } from '@angular/forms';

@Component({
  selector: 'app-template-driven',
  templateUrl: './template-driven.component.html',
  styleUrls: ['./template-driven.component.css']
})
export class TemplateDrivenComponent implements OnInit {

  countryList:country[] = [
    new country("1","India"),
    new country("2","USA"),
    new country("3","England")
  ];

  contact: contact = new contact;
  
  ngOnInit(): void {
    this.contact = {
      firstname: "Jeet",
      lastname: "Shah",
      email: "j@gmail.com",
      gender: "male",
      isMarried: true,
      country: "2",
      address: { city: "Mumbai", street: "Perry Cross Rd", pincode: "400050" }
    };
  }

  constructor() { }


onSubmit(contactForm: { value: any; }) {
  console.log(contactForm.value);
}

  setDefaults() {
    this.contact = {
      firstname: "Hiren",
      lastname: "Panchal",
      email: "h@gmail.com",
      gender: "male",
      isMarried: false,
      country: "3",
      address: { city: "Mumbai", street: "Perry Cross Rd", pincode: "400050" }
    };
  }
 
  changeCountry() {
    this.contact.country = "1";
  }
 
  reset(contactForm :NgForm) {
    contactForm.resetForm();
  }

}

export class country {

  id: string='';
  name: string='';
  constructor(id: string, name:string) {
    this.id = id;
    this.name = name;
  }
}

export class contact{
  firstname:string = '';
  lastname: string = '';
  email: string = '';
  gender: string = '';
  isMarried: boolean = false;
  country: string = '';
  address!: {
    city: string;
    street: string;
    pincode: string;
  };
}
