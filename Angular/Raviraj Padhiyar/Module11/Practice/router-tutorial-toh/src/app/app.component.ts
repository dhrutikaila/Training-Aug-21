import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { slideAnimation } from './animation';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  animations : [ slideAnimation]
})
export class AppComponent {
  title = 'router-tutorial-toh';

  getAnimationData(outlet : RouterOutlet){
    return outlet?.activatedRouteData?.['animation']
  }
}
