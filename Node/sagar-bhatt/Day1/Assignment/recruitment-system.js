$(() => {
  // url = "./json/vacancies.json";
  // async function getVacancies(url) {
  //   let data = await fetch(url);
  //   let obj = await data.json();
  // }

  // getVacancies(url);

  // * Class: Vacancies
  class Vacancies {
    constructor(department, noOfVacancies) {
      this.department = department;
      this.noOfVacancies = noOfVacancies;
    }
    getVacancy() {
      return {
        department: this.department,
        noOfVacancies: this.noOfVacancies,
      };
    }
  }

  // * Create Vacancies
  $("#formVacancies #btnVacancies").on("click", () => {
    const txtDepartment = $("#formVacancies #txtDepartment").val();
    const nmbVacancies = $("#formVacancies #nmbVacancies").val();

    if (txtDepartment.trim() !== "" && nmbVacancies.trim() !== "") {
      const objVacancies = new Vacancies(txtDepartment, nmbVacancies);
      const item = objVacancies.getVacancy();

      const key = "vacancies";
      let lsVacancies = JSON.parse(localStorage.getItem(key));
      if (lsVacancies) {
        lsVacancies.push(item);
        lsVacancies = JSON.stringify(lsVacancies);
        localStorage.setItem(key, lsVacancies);
      } else {
        let newVacancies = [];
        newVacancies.push(item);
        lsVacancies = JSON.stringify(newVacancies);
        localStorage.setItem(key, lsVacancies);
      }
    }
  });

  // * Display Vacancies
  let getVacancies = JSON.parse(localStorage.getItem("vacancies"));
  $.each(getVacancies, (index, value) => {
    $("#tbodyVacancies")
      .append($("<tr></tr>"))
      .append($("<td></td>").text(value["department"]))
      .append($("<td></td>").text(value["noOfVacancies"]))
      .append(
        $("<td></td>")
          .append(
            $("<a></a>")
              .prop({
                class: "btn btn-dark bg-dark py-1",
                href: "./index.html",
              })
              .text("X")
          )
          .on("click", () => {
            console.log(index);
            getVacancies.splice(index, 1);
            getVacancies = JSON.stringify(getVacancies);
            localStorage.setItem("vacancies", getVacancies);
          })
      );
  });

  // * Vacancies: department, noOfVacancy
  // * Applicant: vacancies, data
  // * Interview : applicant, timing, result

  // hr > vac
  // app > vac apply
  // hr > applicant numner / cross check
  // hr > interview timing process
  // hr > resulut declare
  // app > selected /rejected
});
