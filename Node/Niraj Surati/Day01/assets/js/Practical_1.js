async function getJson(file){
    let data = await fetch(file);
    let jsonData = await data.json();
    return jsonData;
}

class Vacancies{

    constructor(DepartmentName,VacanciesNO,jsonData){
        this.DepartmentName = DepartmentName;
        this.VacanciesNO = VacanciesNO;
        this.jsonData = jsonData;
    } 
    async setVacancies(){

        let jsonData = await this.jsonData;
        jsonData = JSON.parse(jsonData);
        jsonData.push({"Department": this.DepartmentName,
        "VacanciesNo": this.VacanciesNO}); 
        console.log(jsonData);
    }
}


let jsonFile  = "vacancies.json" ;
let dName = "PHP";
let no = 5;
let obj = new Vacancies(dName,no,getJson(jsonFile));
obj.setVacancies();

function MyClass() {
    this.instanceData = "Display Me";

    this.DisplayData = function() {
        alert(this.instanceData);
    }
}

classInstance = new MyClass();