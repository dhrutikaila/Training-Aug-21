// This project is aimed at developing a web-based and central Recruitment Process System for the HR Group for a company. Some features of this system will be creating vacancies, storing Applicants data, Interview process initiation, Scheduling Interviews, Storing Interview results for the applicant and finally Hiring of the applicant. Reports may be required to be generated for the use of HR group.


//vacancies class
class vacancies {
    constructor() {
        this.Vacancies_data = []

    }
    set_Vacancies_data(VacancieID, Department, vacancie) {
        this.VacancieID = VacancieID;
        this.Department = Department;
        this.vacancie = vacancie;
        this.Vacancies_data.push({ 'VacancieID': this.VacancieID, 'Department': this.Department, 'vacancie': this.vacancie })
    }
    get_Vacancies_data() {
        return (this.Vacancies_data)
    }
}

//Applicants---
class Applicants {
    constructor() {
        this.Applicants_data = [];

    }
    set_Applicants(ApplicationId, VacancieID, FirstName, LastName, Department, Percentage) {

        this.ApplicationId = ApplicationId
        this.VacancieID = VacancieID
        this.FirstName = FirstName
        this.LastName = LastName
        this.Department = Department
        this.Percentage = Percentage

        this.Applicants_data.push({ 'ApplicationId': this.ApplicationId, 'VacancieID': this.VacancieID, 'FirstName': this.FirstName, 'LastName': this.LastName, 'Department': this.Department, 'Percentage': this.Percentage })

    }
    get_Applicants() {
        return (this.Applicants_data)
    }

}

// Schedule_Interview------------->
class Schedule_Interview {

    constructor() {
        this.Schedule_Interview_list = []
    }

    Schedule_Interview(VID, obj) {

        for (var i = 0; i < obj.Applicants_data.length; i++) {
            if (obj.Applicants_data[i].VacancieID == VID) {
                this.Schedule_Interview_list.push(obj.Applicants_data[i])
            }
        }

        return (this.Schedule_Interview_list)

    }


}

//vacancies
var v1 = new vacancies();

// set vacancies
v1.set_Vacancies_data(1, 2, 'EC', 2)
v1.set_Vacancies_data(2, 1, 'EC', 2)
v1.set_Vacancies_data(3, 2, 'CE', 2)
v1.set_Vacancies_data(4, 1, 'EC', 2)
v1.set_Vacancies_data(3, 2, 'CE', 2)

//display vacancies
console.log('------------------------vacancies list-----------------')
console.log(v1.get_Vacancies_data())


// Applicants
var a1 = new Applicants()

// set set_Applicants
a1.set_Applicants(1, 2, "vishal", "roi", "EC", 9, 56)
a1.set_Applicants(2, 1, "vivek", "shah", "EC", 10, 56)
a1.set_Applicants(3, 2, "krunal", "patel", "EC", 14, 67)

//displayt Applicants data
console.log('------------------------Applicants list-----------------')
console.log(a1.get_Applicants())


//Schedule_Interview
var Schedule_Interview1 = new Schedule_Interview()
console.log('------------------------Schedule_Interview list-----------------')
console.log(Schedule_Interview1.Schedule_Interview(2, a1))
