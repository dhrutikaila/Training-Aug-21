import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { NotFoundComponent } from './not-found/not-found.component';
import { StudentListComponent } from './student-list/student-list.component';
import { DeleteStudentComponent } from './delete-student/delete-student.component';
import { EditStudentComponent } from './edit-student/edit-student.component';
import { AddStudentComponent } from './add-student/add-student.component';
import { HomeComponent } from './home/home.component';

const routes: Routes = [
    { path: 'home', component: HomeComponent },
    { path: 'addStudent', component: AddStudentComponent },
    { path: 'delete/:id', component: DeleteStudentComponent },
    { path: 'edit/:id', component: EditStudentComponent },
    { path: 'student-list', component: StudentListComponent },

    { path: '', redirectTo: 'home', pathMatch: "full" },
    { path: "**", component: NotFoundComponent }
];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})
export class AppRoutingModule { }