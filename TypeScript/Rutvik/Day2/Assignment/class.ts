import {item,customer} from "./interface";

class Item implements item{
    
    item_id: number;
    item_name: string;
    item_quantity: number;

    constructor(id,name,qty){
        this.item_id = id;
        this.item_name = name;
        this.item_quantity = qty;
    }

}

class Customer implements customer{

    cust_id: number;
    cust_name: string;
    cust_phone: number;
    cust_email: string;

    constructor(id,name,phone,email){
        this.cust_id = id;
        this.cust_name = name;
        this.cust_phone = phone;
        this.cust_email = email;
    }

    customer_detail():void{
        console.log(`id: ${this.cust_id}  --  name: ${this.cust_name}  --  phone: ${this.cust_phone}  --  email: ${this.cust_email}`);
    }

}


export {Item,Customer};