$(function () {
  $("span:last-of-type").css({ color: "red" }); // ?  :first, :last, :first-child, :last-child, :odd, :even, :first-child:odd, :last-child:odd, nth-child(2)
  // * Ancestors: parent(), parents(), parentUntil()
  $(".ancestors span").parent().css({ fontSize: "30px" });
  //   $(".ancestors span").parents().css({ color: "green" });
  $(".ancestors span").parentsUntil("div").css({ border: "1px solid orange" });

  // * Descendants: Children(), Find()
  $(".descendants").children().css({ border: "1px solid orange" });
  $(".descendants").find("span").css({ fontSize: "30px" });

  // * Siblings: siblings(), next(), nextAll(), nextUntil(), prev(), prevAll(), prevUntil()
  $(".siblings h3").siblings().css({ fontSize: "30px" });
  $(".siblings h3").siblings("p").css({ fontSize: "10px" });
  $(".siblings h3").next().css({ fontSize: "20px" });
  $(".siblings p").nextAll().css({ textDecoration: "underline" });
  $(".siblings span").nextUntil("h3").css({ backgroundColor: "skyblue" });
  console.log(
    $(".siblings h3").prev(),
    $(".siblings h3").prevAll(),
    $(".siblings h3").prevUntil("p")
  );

  // * Filtering: first(), last(), eq(), filter(), not()
  $(".filtering div").first().css({ backgroundColor: "whitesmoke" });
  $(".filtering div").last().css({ backgroundColor: "lightyellow" });
  // ? The eq() method returns an element with a specific index number of the selected elements.
  $(".filtering div").eq(1).css({ backgroundColor: "lightgreen" });
  // ? The filter() method lets you specify a criteria.
  $(".filtering div").filter(".filter").css({ textDecoration: "underline" });
  // ? The not() method returns all elements that do not match the criteria.
  $(".filtering div").not(".filter").css({ textDecoration: "overline" });
  // * The not() method is the opposite of filter().

  // * jQuery Ajax: Load method, jQuery get and getJson methods, jQuery POST request, Retrieving js file
  // ? The load() method loads data from a server and puts the returned data into the selected element.
  // ? Syntax: $(selector).load(URL,data,callback);
  $(".ajax").load("test-ajax.json", function (responseText, statusText, xhr) {
    if (statusText == "success") {
      console.log(responseText);
    }
    if (statusText == "error") {
      console.log(xhr.status, xhr.statusText);
    }
  });

  //  * The $.get() method requests data from the server with an HTTP GET request.
  //  ? Syntax: $.get(URL,callback);
  $.get("test-ajax.json", function (data, status) {
    console.log("Get:", data, status);
  });
  $.getJSON("test-ajax.json", function (data, status) {
    console.log("getJson", data, status);
  });

  // * The $.post() method requests data from the server using an HTTP POST request.
  // ? Syntax: $.post(URL,data,callback);
  $.post(
    "https://reqres.in/api/users",
    {
      name: "harsh",
      age: 13,
    },
    function (data, status) {
      console.log(data, status);
    },
    "json" //dataType--optional
  );

  // TODO: https://www.w3schools.com/jquery/jquery_ref_ajax.asp
  $.ajax({
    type: "POST",
    url: "https://reqres.in/api/users",
    contentType: "application/json",
    dataType: "json",
    data: JSON.stringify({
      name: "harsh",
      age: 13,
    }),
    success: function (data, status) {
      console.log(data, status);
    },
  });
});
