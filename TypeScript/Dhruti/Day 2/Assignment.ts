

//There is a retail shop which need to manage the inventory, whenever some purchase is being made product quantity should be reduced,
//if quanity is less than 5 reorder request should be raised.`
//Design an interface and classes for the same.



interface Iretail {
    empCode: number;
    name: string;
    getSalary:(empCode: number) => number;
}

class inventory implements Iretail { 
    empCode: number;
    name: string;

    constructor(code: number, name: string) { 
        this.empCode = code;
        this.name = name;
    }

    getSalary(empCode:number):number { 
        return 20000;
    }
}

let emp = new Employee(1, "Steve");