// Create Rectangle.js and compute AreaofRectangle and perimeter of Rectangle, and exports area and perimeter of rectangle

var l = 2;
var b = 5;

var area = () => {
    return (l * b)
}

var perimeter = () => {
    return (2 * (l + b))
}

module.exports = { area, perimeter };