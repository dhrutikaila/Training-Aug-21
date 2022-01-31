import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-item',
  templateUrl: './item.component.html',
  styleUrls: ['./item.component.css']
})
export class ItemComponent implements OnInit {
show:boolean = true;
ProductList:Array<any> =[];
Employee: { EmployeeId: number, EmployeeName: string, City: string}[] = [
    { "EmployeeId": 1, "EmployeeName": "Shreya", "City": "AHmedabad" },
    { "EmployeeId": 2, "EmployeeName": "Diya", "City": "Mumbai"},
    { "EmployeeId": 3, "EmployeeName": "Dharal", "City": "Rajkot"},
    { "EmployeeId": 4, "EmployeeName": "Bhavya", "City": "Vadodara"},
    { "EmployeeId": 5, "EmployeeName": "Riya", "City": "Mumbai"}
  ];
  constructor() {
      this.ProductList=[{Productname : "Pencil",Price : 10 , status : "Active"},
                        {Productname : "NoteBook",Price : 20 , status :"Inactive"},
                        {Productname : "Pen",Price : 15 , status :"Active"}]
   }

  ngOnInit(): void {
  }
  showorHide(){
    if(this.show == true){
      this.show = false;
    }
    else{
      this.show = true;
    }
  }

}
