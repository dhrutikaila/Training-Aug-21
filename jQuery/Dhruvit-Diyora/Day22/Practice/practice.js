//Create one paragraph, add some dummy text and apply blue background color using jquery
$("#button").click(function () {
  $("#pract1").append(" <p>Appended text</p>.");
  $("#pract1").css({ "background-color": "blue" });
});

//There is one Hide/show the text inside the #helpText span element when the user’s mouse passes over the text “
$("#helpText").hover(
  function () {
    $("#helpText").hide();
    console.log("Mouse hover over helpText!");
  },
  function () {
    $("#helpText").show();
    console.log("Bye! You now leave helpText!");
  }
);

//3. – Label : “Please select your technology :”

// – Consider following set of radio buttons :-

//   “PHP”, “ASP.NET”, “ASP”, “JSP”, “PERL”, “Cold Fusion”, “Other”. Layout these buttons in a Horizontal manner.

// – Clicking on a particular radio button should display the related technology name besides label : “You have  selected : “.

// – Use multiple “span” HTML element for displaying the related message.

// – Note that radio button should be selectable by clicking on the corresponding label.
$("input:radio[name=technology]").change(function () {
  selected_value = $("input[name='technology']:checked").val();
  $("#selected").html(" <span>" + selected_value + "</span>");
});
