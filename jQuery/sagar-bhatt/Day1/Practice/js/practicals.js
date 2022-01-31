$(function () {
  // * Practical 1: Create one paragraph, add some dummy text and apply blue background color using jquery.
  const para =
    "Lorem ipsum dolor sit amet consectetur adipisicing elit.Corporis possimus autem distinctio officiis repudiandaeprovident a fuga consectetur repellat voluptatibus placeat iustoquae veniam, similique dignissimos excepturi. Doloremque, suntfuga odit temporibus commodi esse fugit voluptatem suscipit, id,excepturi aliquid accusantium ratione numquam magni neque quamrem eum distinctio sint perferendis. Doloribus maiores at nisilabore fugiat laudantium dignissimos architecto temporibus ad.Dolores praesentium nostrum repudiandae, incidunt dicta beataetempora alias quos quisquam aliquid quasi doloremque eaconsectetur voluptate maxime quidem blanditiis dolore?Consectetur assumenda architecto illo quas deserunt perferendisquasi dolores itaque deleniti officiis! Aspernatur ipsa rerumplaceat adipisci.";
  $(".firstPara, #helpText span")
    .text(para)
    .addClass("bg-primary bg-opacity-25")
    .css({ textIndent: "70px" });

  // * Practical 2: There is one Hide/show the text inside the #helpText span element when the user’s mouse passes over the text.

  $("#helpText").hover(function () {
    $("#helpText span").fadeToggle("slow");
  });

  // * Practical 3: Clicking on a particular radio button should display the related technology name besides label : "Yo" have selected :
  const rbTech = [
    "PHP",
    "ASP.NET",
    "ASP",
    "JSP",
    "PERL",
    "Cold Fusion",
    "Other",
  ];

  $.each(rbTech, function (index, value) {
    $(".technologies")
      .addClass("text-center")
      .append(
        $("<div>")
          .addClass("form-check-inline")
          .append(
            $("<input>").prop({
              type: "radio",
              id: `rbTech${index}`,
              name: "rbTech",
              value: value,
              class: "form-check-input",
            })
          )
          .on("change", function () {
            $(".rbMessage span").text(value);
          })
          .append(
            $("<label></label>")
              .prop({ for: `rbTech${index}`, class: "form-check-label" })
              .text(value)
          )
      );
  });
  $("<div></div>")
    .insertAfter(".technologies")
    .addClass("rbMessage text-center")
    .text("You have selected: ")
    .append("<span></span>");
});
