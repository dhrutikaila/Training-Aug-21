//Generics

//simple number Identity function

// function Identity(arg : number) number {
//     return arg;
// }

// Identity(2);



function Identity<Type>(arg: Type): Type {
    return arg;
}

interface Person {
    name: string;
    height: number;
    weight: number;
}

console.log(Identity<Person>({ name: "Raviraj", height: 180, weight: 65 }));


//now let us update Idneity func

// function Identity2<Type>(arg:Type) :Type {
//     // console.log(arg.length); => throw error as type doesnt define a valid lenght property for all possible types
//     return arg;
// }


function Identity2<Type>(arg: Type[]): Type[] {
    console.log(arg.length) // works because the compiler know that we are passing array and array has a length property
    return arg;
}

console.log(Identity2<number>([2, 3, 4, 5, 6, 5]));



//generic types


let myIdentity: <Input>(arg: Input) => Input = Identity;

console.log(myIdentity<string>('raviraj'));

console.log(typeof myIdentity<string>('hello'));


//generic interfaces


// interface GenericIdnetityFn {
//     <T>(arg: T): T;
// }

interface GenericIdnetityFn<T> {
    (arg: T): T;
}


let myIdentity2: GenericIdnetityFn = Identity;


//generic classes

class GenericNumber<T> {
    zeroValue: T;
    add: (x: T, y: T) => T;
}

let myGenericNumber = new GenericNumber<number>();

myGenericNumber.zeroValue = 0;
myGenericNumber.add = function (x, y) {
    return x + y;
}

let myStringNumber = new GenericNumber<string>();
myStringNumber.zeroValue = "";
myStringNumber.add = function (x, y) {
    return x + y;
}

console.log(myStringNumber.add(myStringNumber.zeroValue, "test"));


//generic constraint

interface lengthwise {
    length: number;
}

function loggingIdentity<T extends lengthwise>(arg: T): T {
    console.log(arg.length);
    return arg;
}

// console.log(loggingIdentity(2)) throw error as logging Identity 
// as number doesn't have length methods
// all enumberable can be used 

loggingIdentity([2, 3, 4, 5]);
loggingIdentity({ value: 2, length: 1 }); // 

//Using Type Parameters in Generic Constraints

function getProperty<T, Key extends keyof T>(obj: T, key: Key): T[Key] {
    return obj[key];
}

let x = { a: 1, b: 2 };

getProperty(x, "a");
// getProperty(x,"m") // throw error as no key of name m belong to object x;

//Using Class Types in Generic

// function create<Type>(c: { new(): Type }): Type {
//     return new c();
// }

class ZooKeeper {
    nametag: string = 'Mikle';
}

class Animal {
    numLegs: number = 4;
}

class Bee extends Animal {
    keeper: BeeKeeper = new BeeKeeper();
}

class Lion extends Animal {
    keeper: ZooKeeper = new ZooKeeper();
}

function createInstance<A extends Animal>(c: new () => A): A {
    return new c();
}

createInstance(Lion).keeper.nametag;
createInstance(Bee).keeper.hasMask;

console.log(createInstance(Lion).keeper.nametag);
console.log(createInstance(Bee).keeper.hasMask);


