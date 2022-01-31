import { Component, OnInit  , Input ,Output,EventEmitter} from '@angular/core';

@Component({
  selector: 'app-stock-status-component',
  templateUrl: './stock-status-component.component.html',
  styleUrls: ['./stock-status-component.component.css']
})
export class StockStatusComponentComponent implements OnInit {

  constructor() {
    
   }
  @Input() stock: number =0;
  @Input() productId?: number;
  @Output() stockValueChange = new EventEmitter();
  color = '';
 updatedstockvalue : number =0;
    stockValueChanged() {
        this.stockValueChange.emit({ id: this.productId, updatdstockvalue: this.updatedstockvalue });
        this.updatedstockvalue = 0;
    }
  ngOnInit(): void {
  }

  ngOnChanges(){
    if (this.stock > 10) {
      this.color = 'green';
    } else {
      this.color = 'red';
    }
  }
}
