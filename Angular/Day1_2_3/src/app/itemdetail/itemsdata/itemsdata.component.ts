
import { Component,Input } from '@angular/core';
@Component({
  selector: 'app-itemsdata',
  templateUrl: './itemsdata.component.html',
  styleUrls: ['./itemsdata.component.css']
})
export class ItemsdataComponent {

 @Input() item='';

}
