//These Components are role-based. But authorization will be processed by back-end.
//We only need to call UserService methods:

//getUserBoard()
//getModeratorBoard()
//getAdminBoard()
//Here is an example for BoardAdminComponent.
//BoardModeratorComponent & BoardUserComponent are similar.


import { Component, OnInit } from '@angular/core';
import { UserService } from '../_services/user.service';
@Component({
  selector: 'app-board-admin',
  templateUrl: './board-admin.component.html',
  styleUrls: ['./board-admin.component.css']
})
export class BoardAdminComponent implements OnInit {

  content?: string;

  constructor(private userService: UserService) { }

  ngOnInit(): void {
    this.userService.getAdminBoard().subscribe(
      data => {
        this.content = data;
      },
      err => {
        this.content = JSON.parse(err.error).message;
      }
    );
  }
}
