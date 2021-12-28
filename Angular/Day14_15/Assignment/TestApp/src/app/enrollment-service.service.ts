import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { catchError, throwError } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class EnrollmentService {


  constructor(private http: HttpClient) { }

  endPoints: string = "api/"

  addStudent(student: any) {
    this.endPoints = "api/student/"
    return this.http.post(this.endPoints, student);
  }

  updateStudent(student: any) {
    this.endPoints = "api/student/"
    return this.http.put(this.endPoints, student);
  }

  getStudent(id: number) {
    this.endPoints = "api/student/"
    return this.http.get(this.endPoints + id);
  }

  getStudents() {
    this.endPoints = "api/student/"
    return this.http.get(this.endPoints);
  }

  deleteStudent(id: number) {
    this.endPoints = "api/student/"
    return this.http.delete(this.endPoints + id);
  }

  getCity(id: number) {
    return this.http.get(this.endPoints + id).pipe(
      catchError(this.handleError)
    )
  }
  getStateWiseCity(id: number) {
    return this.http.get('api/city/statewise/' + id)
  }
  getState(id: number) {
    return this.http.get('api/state/' + id)
  }
  getCountryWiseState(id: number) {
    return this.http.get('api/state/countrywise/' + id)
  }
  getCountry() {
    return this.http.get('api/country/')
  }

  private handleError(error: HttpErrorResponse) {
    console.error(`Backend returned code ${error.status}, body was: `, error.error);
    return throwError(
      'Something bad happened; please try again later.');
  }
}
