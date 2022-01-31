import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  products: any = [];
  ngOnInit() {
    this.products = this.getProducts();
  }
  getProducts() {
    return [
      { 'id': '1', 'title': 'Screw Driver', 'price': 400, 'stock': 11 },
      { 'id': '2', 'title': 'Nut Volt', 'price': 200, 'stock': 5 },
      { 'id': '3', 'title': 'Resistor', 'price': 78, 'stock': 45 },
      { 'id': '4', 'title': 'Tractor', 'price': 20000, 'stock': 1 },
      { 'id': '5', 'title': 'Roller', 'price': 62, 'stock': 15 },
    ];
  }
  title = 'Products';
  name = "Shreya"
  parentData = ''
  TransferData() {
    this.parentData = this.name;
  }
  list: Array<any> = [];
  addata(arr: any[]) {
    this.list = arr;
  }
  productToUpdate: any;
  changeStockValue(p : any) {
      this.productToUpdate = this.products.find(this.findProducts, [p.id]);
      this.productToUpdate.stock = this.productToUpdate.stock + p.updatdstockvalue;
  }
  findProducts(p : any) {
      return p.id;
  }

}
