document.body.onload = () => {
  const validation = (input, validator) => {
    if (isNaN(input.value)) {
      validator.style.display = "block";
    } else {
      validator.style.display = "none";
    }
  };
  // * Practical: 1 Using Function Expression, find the area of circle.
  let txtRadius = document.getElementById("txtRadius");
  let validateRadius = document.getElementById("validateRadius");
  let areaOfCircle = document.getElementById("areaOfCircle");

  txtRadius.onkeyup = () => {
    validation(txtRadius, validateRadius);

    const PI = 3.14;
    const circle = (radius) => PI * radius * radius;
    areaOfCircle.innerHTML = `Area of Circle: ${circle(txtRadius.value)}`;
  };

  // * Practical: 2 Using Function Constructor, find the area of rectangle.
  // * Practical: 3 Explain usage of Function Hosing using example.
  let txtLength = document.getElementById("txtLength");
  let txtWidth = document.getElementById("txtWidth");
  let validateLength = document.getElementById("validateLength");
  let validateWidth = document.getElementById("validateWidth");
  let areaOfRect = document.getElementById("areaOfRect");

  txtLength.onkeyup = rectangle;
  txtWidth.onkeyup = rectangle;

  // * Hoisted
  function rectangle() {
    validation(txtLength, validateLength);
    validation(txtWidth, validateWidth);

    const areaOfRectangle = new Function(
      "length",
      "width",
      "return length * width"
    );
    areaOfRect.innerHTML = `Area of Rectangle: ${areaOfRectangle(
      txtLength.value,
      txtWidth.value
    )}`;
  }
};
