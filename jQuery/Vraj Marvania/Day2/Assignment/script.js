// Use getJSON method access this web api  https://gorest.co.in/public-api/users and display the result in one table.


$(document).ready(function(){
    $.getJSON("https://gorest.co.in/public-api/users",function(result){
        $.each(result.data,function(id,datas){
         $("tbody").append("<tr><td>"+datas.id+"</td><td>"+datas.name+"</td><td>"+datas.email+"</td><td>"+datas.gender+"</td><td>"+datas.status+"</td></tr>")
        })
    })
}); 