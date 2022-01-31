interface IInventory {
    productId: number
    productName: string
    price: number
    stock: number
}

class Product implements IInventory {
    productId: number
    productName: string
    price: number
    stock: number

    constructor(productId: number, productName: string, price: number, stock: number) {
        this.productId = productId
        this.productName = productName
        this.price = price
        this.stock = stock
    }
}

class Order {
    orderId: number
    productId: number
    price: number
    orderQuanity: number

    constructor(orderId: number, productId: number, price: number, orderQuanity: number) {
        this.orderId = orderId
        this.productId = productId
        this.price = price
        this.orderQuanity = orderQuanity
    }
}

type Purchase = {
    productId: number
    price: number
    quantityPurchased: number
}

var products: Product[] = []
var orders: Order[] = []
var purcahseHistory: Purchase[] = []

function AddProduct(productId: number, productName: string, price: number, stock: number):void{
    var newProduct = new Product(productId,productName,price,stock)
    products.push(newProduct)
}

// AddProduct(1,"Mouse",300,25)
// AddProduct(2,"Keyboard",500,20)

function Purchase(productId: number, quantity: number): void {
    var product: Product
    for (var p of products) {
        if (p.productId == productId) {
            product = p
            break
        }
    }
    if (product != null) {
        if (quantity < product.stock) {
            var purchase: Purchase = { productId: product.productId, price: product.price, quantityPurchased: quantity }
            purcahseHistory.push(purchase)
            product.stock -= quantity
            console.log(`\nYou have purchased ${product.productName} successfully!!`)
            if (product.stock < 5) {
                MakeOrderRequest(1, 50, product)
            }
        }
        else {
            console.log("Out of stock!!")
            if (product.stock < 5) {
                MakeOrderRequest(1, 50, product)
            }
        }
    }
    else{
        console.log("Product not found!")
    }
}

function MakeOrderRequest(orderId: number, quanity: number, product: Product):void {
    var orderRequest = new Order(orderId, product.productId, product.price, quanity)
    orders.push(orderRequest)
}

function GetStockDetails():void {
    products.forEach(p => {
        console.log(p)
    });
}

function GetOrderReuests():void {
    orders.forEach(p => {
        console.log(p)
    });
}

function GetProductsList() {
    products.forEach(product => {
        console.log(`ProductId : ${product.productId}, Product : ${product.productName}, Price : ${product.price}`)
    });
}

console.log("\nWelcome to my shop!!\n\nList of available items:")
GetProductsList()
console.log("1.Make purchase\n2.Get Order Details\n3.Get Stock Details\n4.Get order request data\n5.Add Product")
var choice: number = 1
switch (choice) {
    case 1:
        var productId: number = 1;
        var quantity: number = 18;
        Purchase(productId, quantity)
        break
    case 2:
        var totalamount: number = 0
        console.log("\nOrder Details:")
        purcahseHistory.forEach(p => {
            console.log(`\nProduct : ${p.productId}, Price : ${p.price}, Quantity : ${p.quantityPurchased}, Total Price : ${p.price * p.quantityPurchased}`)
            totalamount += p.price * p.quantityPurchased
        });
        console.log(`\nTotal amount to pay : ${totalamount}`)
        break
    case 3:
        GetStockDetails()
        break
    case 4:
        GetOrderReuests()
        break
    case 5:
        var productId:number = 1
        var productName:string = "Mouse"
        var price:number = 500
        var stock:number = 20
        AddProduct(productId,productName,price,stock)
        break;
    default:
        console.log("Invalid choice!!")
        break
}
