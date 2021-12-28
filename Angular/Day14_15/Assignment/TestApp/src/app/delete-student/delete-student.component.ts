import { Component, OnInit } from '@angular/core';
import { EnrollmentService } from '../enrollment-service.service';
import { ActivatedRoute, Router } from '@angular/router';
@Component({
  selector: 'app-delete-student',
  templateUrl: './delete-student.component.html',
  styleUrls: ['./delete-student.component.css']
})
export class DeleteStudentComponent implements OnInit {

  constructor(private apiService: EnrollmentService, private route: ActivatedRoute, private router: Router) { }

  studentId: number = 0

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.studentId = params['id']
    })

    this.apiService.deleteStudent(this.studentId).subscribe(data => {
      console.log(data)
      alert("Record deleted successfully!!")
      if (confirm("Want to check available records?")) {
        this.router.navigate(['get'])
      }
    })
  }

}
