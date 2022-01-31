import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router,ActivatedRoute } from '@angular/router';
 
import { ProductService } from '../product.service';
import { Product } from '../product';
 
 
@Component({
  templateUrl: './product-detail.component.html',
})
 
export class ProductDetailComponent
{
 
   product: any;
   id: any;
   
   constructor(private _Activatedroute:ActivatedRoute,
               private _router:Router,
               private _productService:ProductService){
   }
 
   
   sub: any;
 
   ngOnInit() {
 
      this.sub=this._Activatedroute.paramMap.subscribe(params => { 
         console.log(params);
          this.id = params.get('id'); 
          // this.id = params['id']; 
          let products=this._productService.getProducts();
          this.product=products.find(p => p.productID==this.id);    
      });
   }
 
   ngOnDestroy() {
     this.sub.unsubscribe();
   }
   
   onBack(): void {
      this._router.navigate(['product']);
   }
}