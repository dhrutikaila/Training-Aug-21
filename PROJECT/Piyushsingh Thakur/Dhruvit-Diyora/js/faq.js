$(document).ready(function () {
  if (!sessionStorage.hasOwnProperty("Questions")) {
    fetch("http://127.0.0.1:5500/json/questions.json")
      .then((result) => {
        return result.json();
      })
      .then((res) => {
        var datas = JSON.stringify(res);

        console.log(datas);
        sessionStorage.setItem("Questions", datas);
        location.reload();
      })
      .catch((error) => {
        console.log(error);
      });
  }
  var localData = sessionStorage.getItem("Questions");
  var jsonData = JSON.parse(localData);
  jsonData.forEach((obj) => {
    $("#myAccordion").append(
      `<div class="accordion-item">
    <h2 class="accordion-header" id="heading` +
        obj.id +
        `">
      <button
        type="button"
        class="accordion-button collapsed"
        data-bs-toggle="collapse"
        data-bs-target="#collapse` +
        obj.id +
        `"
      >` +
        obj.q +
        `</button>
            </h2>
            <div
              id="collapse` +
        obj.id +
        `"
              class="accordion-collapse collapse"
              data-bs-parent="#myAccordion"
            >
              <div class="card-body">
                <p>` +
        obj.ans +
        `</p>
              </div>
            </div>
          </div>`
    );
  });
});
