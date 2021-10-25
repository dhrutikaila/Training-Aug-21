$(document).ready(function() {

    OrderList();

});

function OrderList() {
    var Order_Details = JSON.parse(localStorage.getItem("Order"));
    var Id;

    $.each(Order_Details, function(index, Data) {
        Id = index + 1;
        $("#TableData").append("<tr>" +
            "<td>" + Id + "</td>" +
            "<td>" + Data.UserName + "</td>" +
            "<td>" + Data.ContactNumber + "</td>" +
            "<td>" + Data.Address + "</td>" +
            "<td>" + Data.PizzaDelivery + "</td>" +
            "<td>" + Data.Total + "</td>" +
            "<td>" + Data.Cart_Items + "</td>" +
            "<td><button class='btn btn-danger' onclick='Cancel(" + index + ")'>Cancel Order</button></td></tr>");
    });
}

function Cancel(index) {

    var Order_list = JSON.parse(localStorage.getItem("Order"));
    Order_list.splice(index, 1);
    localStorage.setItem("Order", JSON.stringify(Order_list));

    $("#TableData").html(" ");

    OrderList();
    alert("Your Order is Deleted Successfully..");

}

function clearUserData() {
    localStorage.clear();
}