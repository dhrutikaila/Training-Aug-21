
function RectangleArea(width, height) {
    let res = 0;
    res= width * height;
    return res;
}

function RectanglePerimeter(width, height) {
    let res1 = 0;
    res1 = 2*(width + height);
    return res1;
}

module.exports = {
    Area: RectangleArea,
    Perimeter:RectanglePerimeter
}