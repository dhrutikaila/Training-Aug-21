function getdata(){
    var vacancy = new Array();
    vacancy = JSON.parse(localStorage.getItem('vacancyData'));

     document.getElementById("reactjs").value = vacancy[0].react_vacancy;
     document.getElementById("nodejs").value = vacancy[0].node_vacancy;
     document.getElementById("dotnet").value = vacancy[0].dotnet_vacancy;
     document.getElementById("angularjs").value = vacancy[0].angular_vacancy;
}
