import { Component, OnInit } from '@angular/core';
import { EnrollmentService } from '../enrollment-service.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.css']
})
export class StudentListComponent implements OnInit {

  constructor(private apiService: EnrollmentService, private router: Router) { }

  studentList: any

  ngOnInit(): void {
    this.apiService.getStudents().subscribe(data => {
      this.studentList = data
    })
  }

  editStudent(id: number) {
    this.router.navigate(['edit', id])
  }

  deleteStudent(id: number) {
    if (confirm("Are you sure to delete?")) {
      this.router.navigate(['delete', id])
    }
  }
}
