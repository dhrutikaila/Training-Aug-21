$(() => {
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
              .text("X")
          )
          .on("click", () => {
            console.log(index);
            getVacancies.splice(index, 1);
            getVacancies = JSON.stringify(getVacancies);
            localStorage.setItem("vacancies", getVacancies);
          })
      );

    // * APPEND DEPARTMENTS IN APPLICANT FORM
    $("#selDepartment").append(
      $(`<option></option>`).val(value["department"]).text(value["department"])
    );
  });

  // * Class: Applicant
  class Applicants {
    constructor(name, qualification, department) {
      this.name = name;
      this.qualification = qualification;
      this.department = department;
    }
    getApplicant() {
      return {
        name: this.name,
        qualification: this.qualification,
        department: this.department,
      };
    }
  }

  // * Create Applicant
  $("#formApplicants #btnApplicants").on("click", () => {
    const txtApplicant = $("#formApplicants #txtApplicant").val();
    const txtQualification = $("#formApplicants #txtQualification").val();
    const selDepartment = $("#formApplicants #selDepartment").val();

    if (
      txtApplicant.trim() !== "" &&
      txtQualification.trim() !== "" &&
      selDepartment.trim() !== ""
    ) {
      const objApplicants = new Applicants(
        txtApplicant,
        txtQualification,
        selDepartment
      );
      const item = objApplicants.getApplicant();

      const key = "applicants";
      let lsApplicants = JSON.parse(localStorage.getItem(key));
      if (lsApplicants) {
        lsApplicants.push(item);
        lsApplicants = JSON.stringify(lsApplicants);
        localStorage.setItem(key, lsApplicants);
      } else {
        let newApplicants = [];
        newApplicants.push(item);
        lsApplicants = JSON.stringify(newApplicants);
        localStorage.setItem(key, lsApplicants);
      }
    }
  });

  // * Display Applicants
  let getApplicants = JSON.parse(localStorage.getItem("applicants"));
  $.each(getApplicants, (index, value) => {
    $("#tbodyApplicants")
      .append($("<tr></tr>"))
      .append($("<td></td>").text(value["name"]))
      .append($("<td></td>").text(value["qualification"]))
      .append($("<td></td>").text(value["department"]))
      .append(
        $("<td></td>")
          .append(
            $("<a></a>")
              .prop({
                class: "btn btn-dark bg-dark py-1",
                href: "./index.html",
              })
              .text("Remove")
          )
          .on("click", () => {
            console.log(index);
            getApplicants.splice(index, 1);
            getApplicants = JSON.stringify(getApplicants);
            localStorage.setItem("applicants", getApplicants);
          })
      )
      .append(
        $("<td></td>")
          .append(
            $("<a></a>")
              .prop({
                class: "btn btn-dark bg-dark py-1",
                href: "./index.html",
              })
              .text("Hire")
          )
          .on("click", () => {
            let item = getApplicants.splice(index, 1);
            getApplicants = JSON.stringify(getApplicants);
            localStorage.setItem("applicants", getApplicants);

            item = item[0];

            const key = "selectedApplicants";
            let lsSelApplicants = JSON.parse(localStorage.getItem(key));
            if (lsSelApplicants) {
              lsSelApplicants.push(item);
              lsSelApplicants = JSON.stringify(lsSelApplicants);
              localStorage.setItem(key, lsSelApplicants);
            } else {
              let newApplicants = [];
              newApplicants.push(item);
              lsSelApplicants = JSON.stringify(newApplicants);
              localStorage.setItem(key, lsSelApplicants);
            }
          })
      );
  });
});
