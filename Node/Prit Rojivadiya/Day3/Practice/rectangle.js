class Rectangle{
    constructor(height,width){
        this.height = height;
        this.width = width;
    }

    areaOfRectangle(){
        console.log(`Area of rectangle is: ${this.height * this.width}`);
    }

    perimeter(){
        console.log(`Perimeter of rectangle is: ${2*(this.height + this.width)}`);
    }
}

module.exports = Rectangle;