import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-itemdetail',
  templateUrl: './itemdetail.component.html',
  styleUrls: ['./itemdetail.component.css']
})
export class ItemdetailComponent implements OnInit {
  
  productList:Array<any>=[];​

  constructor() { ​

    this.productList=[​

    {ProductName:"ParkerPen","ProductPrice":1000,"ProductQuantity":50,"rating":1},​

    {ProductName:"CelloPen","ProductPrice":500,"ProductQuantity":50,"rating":2},​

    {ProductName:"WatermanPen","ProductPrice":900,"ProductQuantity":50,"rating":1},​

    {ProductName:"CamlinPen","ProductPrice":400,"ProductQuantity":25,"rating":2}​

  ]​
  this.style = {​

    'color': 'red',​

    'fontsize':'10px'​

  };​

  this.appliedcss="green";​

  }
  style:{"color":string,"fontsize":string,"border-radius"?:string}​

color:string="red";​

fontsize:string="10px";​

appliedcss:string;​

 
​
  ngOnInit(): void {​

  }​

  changeStyle(color:string,fontsize:string)​

  {​

    console.log(color);​

this.style.color=color;​

this.style.fontsize=fontsize;​

  }​

  changecss(value){​

  this.appliedcss=value;​

  }​​
​

​currentItem='Mobiles';

}
