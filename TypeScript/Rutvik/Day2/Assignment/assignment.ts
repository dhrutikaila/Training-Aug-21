/*There is a retail shop which need to manage the inventory,
whenever some purchase is being made product quantity should be reduced, 
if quanity is less than 5 reorder request should be raised.
Design an interface and classes for the same.*/


import {Item,Customer} from './class';
import {item,customer} from './interface';

let customers:customer[] = [];

function addCustomer(id:number,name:string,phone:number,email:string):void{
    let customer = new Customer(id,name,phone,email);
    customers.push(customer);
    customer.customer_detail();
}

addCustomer(1,'Rutvik',9925976644,'rutvik1@gmail.com');
addCustomer(2,'Nayan',8925976644,'nayan1@gmail.com');
addCustomer(3,'Darshan',7925976644,'darshan1@gmail.com');
addCustomer(4,'Ankit',6925976644,'ankit1@gmail.com');
addCustomer(5,'Yash',9825976644,'yash1@gmail.com');


let items: item[] = [];

function addItem(id:number,name:string,quantity:number):void{
    let item = new Item(id,name,quantity);
    items.push(item);
}

addItem(1,'item1',6)
addItem(2,'item2',5)
addItem(3,'item3',7)
addItem(4,'item4',8)


console.log(customers);
console.log(items);

function reOrder(item_id:number, quantity:number):void{
    
    const item = items.find((i)=>{
        return i.item_id == item_id;
    })
    if(item === undefined){
        console.log('Item Not Found');
        return;
    }

    item.item_quantity += quantity;
    console.log(item);
}

function purchase(cust_id:number, item_id:number, qty: number): void{
    
    const customer = customers.find((c)=>{
        return c.cust_id == cust_id; 
    })
    if(customer === undefined){
        console.log('Customer Not Found');
        return;
    }

    const item = items.find((i)=>{
        return i.item_id == item_id;
    })
    if(item === undefined){
        console.log('Item Not Found');
        return;
    }

    if(qty > item.item_quantity){
        console.log(`${item.item_name} Out Of Stock`);
        return;
    }

    // decrease quantity as per order
    item.item_quantity -= qty;

    if(item.item_quantity < 5){
        reOrder(item.item_id,5);
    }else{
        console.log(item);
    }

}

purchase(1,2,1);
purchase(1,2,2);
purchase(2,3,1);