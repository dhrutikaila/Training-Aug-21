function formvalidation(){

    let id=/\b\d{5}\b/g

    let x= document.forms["employeeform"]["employeeid"].value
    if(x==""){
    alert("Please enter the employeeid")
    return false;
    }
    else if(!id.test(x))
    {
        alert("Please enter valid emailid")
    }
    
    let firstname= document.forms["employeeform"]["firstname"].value
    if(firstname==""){
    alert("Please enter the firstname")
    return false;
    }


    let lastname= document.forms["employeeform"]["lastname"].value
    if(lastname==""){
    alert("Please enter the lastname")
    return false;
    }
    
    let age= document.forms["employeeform"]["Age"].value
    if(age==""){
    alert("Please enter the age")
    return false;
    }

    
    let designation= document.forms["employeeform"]["designation"].value
    if(designation==""){
    alert("Please enter the designation")
    return false;
    }

    
    let checkmale= document.forms["employeeform"]["male"].value
    let checkfemale=document.forms["employeeform"]["female"].value
    if(checkmale==0 && checkfemale==0)
    {
    alert("Please select gender")
    return false;
    }    

    let salary= document.forms["employeeform"]["salary"].value
    if(salary==""){
    alert("Please enter the salary")
    return false;
    }
    
    let address= document.forms["employeeform"]["address"].value
    if(address==""){
    alert("Please enter the address")
    return false;
    }
    
    let email= document.forms["employeeform"]["email"].value
    if(email==""){
    alert("Please enter the emailid")
    return false;
    }
    
    let contact= document.forms["employeeform"]["contactnumber"].value
    if(contact==""){
    alert("Please enter the contactnumber")
    return false;
    }

    var dateformat=/\d{2}\-\d{2}\-\d{4}$/
    let date= document.forms["employeeform"]["date"].value
    if(date==""){
    alert("Please enter the date")
    return false;
    }
    else if(!dateformat.test(date)){
    alert("please enter a date in mentioned format");
    return false;
    }
    
    let form=document.forms["employeeform"]
    let element=""
    for(let i=0;i<form.length;i++){
        element+= x.elements[i].value+"<br>";
    }
    document.getElementById("data").innerHTML=element;    
}
