import { Component, OnInit } from '@angular/core';
import { Router,ActivatedRoute } from '@angular/router';
 
import { ProductService } from '../product.service';
import { Product } from '../product';

@Component({
  selector: 'app-overview',
  templateUrl: './overview.component.html',
  styleUrls: ['./overview.component.css']
})
export class OverviewComponent implements OnInit {

  product:any;
  id: any;
  sub: any;

  constructor(private _Activatedroute:ActivatedRoute,
              private _router:Router,
              private _productService:ProductService){
  }
  ngOnInit() {

     this.sub=this._Activatedroute.params.subscribe(params => { 
         this.id = params['id']; 
         let products=this._productService.getProducts();
         this.product=products.find(p => p.productID==this.id);    
     });
  }

  ngOnDestroy() {
    this.sub.unsubscribe();
  }

}
