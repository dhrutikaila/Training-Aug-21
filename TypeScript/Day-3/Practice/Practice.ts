//generic

function display<T>(args : T){
    return args;
}
let op1 = display<string>("hello");
let op2 = display<number>(1)
console.log(op1)

function getArray<T>(items : T[] ) : T[] {
    return new Array<T>().concat(items);
}

let myNumArr = getArray<number>([100, 200, 300]);
let myStrArr = getArray<string>(["Hello", "World"]);

myNumArr.push(400); // OK
myStrArr.push("Hello TypeScript"); // OK

// myNumArr.push("Hi"); // Compiler Error
// myStrArr.push(500); // Compiler Error


//with multiple datatype
function data<T,U>(id:T, name : U):void {
    console.log("Type of id is "+ typeof(id))
    console.log("Type of name is "+ typeof(name))
}
data<number , string>(1 , "shreya")

//generic with non generic 

function dataType<T>(id:T, name : string):void {
    console.log("Type of id is "+ typeof(id))
    console.log("Type of name is "+ typeof(name))
}
dataType<number >(1 , "shreya")

//generic class

class KeyValuePair<T , U>{
    private key : T;
    private value : U;
    
    setKeyValue(key : T , value : U){
        this.key = key;
        this.value = value;
    }

    display=():void=>{
        console.log(`key is ${this.key} , val = ${this.value}`)
    }
}
 let kv1 = new KeyValuePair<number , string>();
 kv1.setKeyValue(1 , "shreya")
 kv1.display();
 let kv2 = new KeyValuePair<string , string>();
 kv2.setKeyValue("Thakkar","shreya")
 kv2.display();

 //generic interface 
 interface IProduct <T>{
     product : T;
     getData () : T
 }

 //interface as type

 interface KeyValue {
     key : number ;
     value : string;
 }
 var kv12 : KeyValue = {key:1 , value:"shreya"} 
 console.log(kv12)

 //namespace 

//  namepace <name>{
     
//  }


//module 