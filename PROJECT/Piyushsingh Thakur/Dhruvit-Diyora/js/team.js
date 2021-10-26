$(document).ready(function () {
  if (!sessionStorage.hasOwnProperty("Team")) {
    fetch("http://127.0.0.1:5500/json/team.json")
      .then((result) => {
        return result.json();
      })
      .then((res) => {
        var datas = JSON.stringify(res);

        console.log(datas);
        sessionStorage.setItem("Team", datas);
        location.reload();
      })
      .catch((error) => {
        console.log(error);
      });
  }
  var localData = sessionStorage.getItem("Team");
  var jsonData = JSON.parse(localData);
  jsonData.forEach((obj) => {
    $("#teamCard").append(
      `<div class="col-md-4 mt-4">
        <div class="card">
        <img src="` +
        obj.picture +
        `" class="card-img-top" alt="...">
        </div>
        <div class="card-body pt-0">
        <h5 class="card-title">` +
        obj.name +
        `
        <span class="text-muted">` +
        obj.job +
        `</span> </h5>
        <p class="card-text">` +
        obj.details +
        `</p> </div></div> </div>`
    );
  });
});
