$(document).ready(function () {
  if (sessionStorage.hasOwnProperty("userPresent")) {
    if (JSON.parse(sessionStorage.getItem("userPresent"))) {
    } else {
      window.location = "/";
      alert("Please Login as admin");
    }
  } else {
    window.location = "/";
    alert("Please Login as admin");
  }
  var faqs, teams;
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

  $(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
      $("#scroll").fadeIn();
    } else {
      $("#scroll").fadeOut();
    }
  });
  $("#scroll").click(function () {
    $("html, body").animate({ scrollTop: 0 }, 600);
    return false;
  });

  faqs = JSON.parse(sessionStorage.getItem("Questions"));
  teams = JSON.parse(sessionStorage.getItem("Team"));
  setFAQ(faqs);
  setTeam(teams);
});
function getTeam() {
  if (!sessionStorage.hasOwnProperty("Team")) {
    fetch("http://127.0.0.1:5500/json/team.json")
      .then((result) => {
        return result.json();
      })
      .then((res) => {
        var datas = JSON.stringify(res);

        console.log(datas);
        sessionStorage.setItem("Team", datas);
      })
      .catch((error) => {
        console.log(error);
      });
  }
}
function setFAQ(faqsData) {
  faqsData.forEach((obj) => {
    $("#faqTbl> tbody").append(
      `<tr>
        <td>` +
        obj.id +
        `</td> <td>` +
        obj.q +
        `</td> <td>` +
        obj.ans +
        `</td> </tr>`
    );
  });
}
function setTeam(teamsData) {
  teamsData.forEach((obj) => {
    $("#teamTbl> tbody").append(
      `<tr>
        <td>` +
        obj.name +
        `</td> <td>` +
        obj.job +
        `</td> <td>` +
        obj.details +
        `</td> <td>` +
        obj.picture +
        `</td> </tr>`
    );
  });
}
$("#addFAQbtn").click(function () {
  $("#addFAQ").appendTo("body").modal("show");
});

$("#addTeambtn").click(function () {
  $("#AddTeam").appendTo("body").modal("show");
});
$("#addFAQSubmit").click(function () {
  var idFAQ = document.getElementById("inputId").value;
  var qFAQ = document.getElementById("inputQuestion").value;
  var ansFAQ = document.getElementById("inputAnswer").value;
  var extractQuestions = JSON.parse(sessionStorage.getItem("Questions"));
  var object = {
    id: parseInt(idFAQ),
    q: qFAQ,
    ans: ansFAQ,
  };
  extractQuestions.push(object);
  sessionStorage.setItem("Questions", JSON.stringify(extractQuestions));
  location.reload();
});

$("#AddTeamsbtn").click(function () {
  var nameTeam = document.getElementById("nameInput").value;
  var jobTeam = document.getElementById("jobInput").value;
  var detailsTeam = document.getElementById("detailsInput").value;
  var pictureTeam = document.getElementById("pictureInput").value;
  var extractTeam = JSON.parse(sessionStorage.getItem("Team"));
  var object = {
    name: nameTeam,
    job: jobTeam,
    details: detailsTeam,
    picture: pictureTeam,
  };
  extractTeam.push(object);
  sessionStorage.setItem("Team", JSON.stringify(extractTeam));
  location.reload();
});
$(".closefaq").click(function () {
  $("#addFAQ").modal("toggle");
});

$(".closeTeam").click(function () {
  $("#AddTeam").modal("toggle");
});
