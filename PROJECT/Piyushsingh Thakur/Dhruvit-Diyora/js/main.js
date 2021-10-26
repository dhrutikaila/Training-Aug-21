$(document).ready(function () {
  if (!sessionStorage.hasOwnProperty("users")) {
    fetch("http://127.0.0.1:5500/json/users.json")
      .then((result) => {
        return result.json();
      })
      .then((res) => {
        var datas = JSON.stringify(res);

        console.log(datas);
        sessionStorage.setItem("users", datas);
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
});
$("#loginbtn").click(function () {
  $("#loginModal").appendTo("body").modal("show");
});

$("#signbtn").click(function () {
  $("#signupModal").appendTo("body").modal("show");
});

$(".closesignup").click(function () {
  $("#signupModal").modal("toggle");
});

$(".closelogin").click(function () {
  $("#loginModal").modal("toggle");
});

$("#signupUser").click(function () {
  var username = document.getElementById("signupInputEmail1").value;
  var password = document.getElementById("signupInputPassword1").value;
  var extractUser = JSON.parse(sessionStorage.getItem("users"));
  var object = {
    Email: username,
    pass: password,
  };
  extractUser.push(object);
  sessionStorage.setItem("users", JSON.stringify(extractQuestions));
});

$("#logincheck").click(function () {
  var username = document.getElementById("exampleInputEmail1").value;
  var password = document.getElementById("exampleInputPassword1").value;
  var userAndPasswordPresent = false;
  var userData = JSON.parse(sessionStorage.getItem("users"));
  for (var i in userData) {
    if (userData[i].Email === username && userData[i].pass === password) {
      userAndPasswordPresent = true;
    }
  }
  if (userAndPasswordPresent) {
    sessionStorage.setItem("userPresent", userAndPasswordPresent);
    window.location = location.hostname + "/admin.html";
  }
});
