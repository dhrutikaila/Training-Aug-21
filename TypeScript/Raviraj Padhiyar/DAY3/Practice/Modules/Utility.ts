function Idneity<T>(arg: T) : T {
    return arg;
}

class employee {
    Id : number;
    name : string;

    print() : void {
        console.log(`${this.Id} id belong to ${this.name}`)
    }
}

export {employee,Idneity};