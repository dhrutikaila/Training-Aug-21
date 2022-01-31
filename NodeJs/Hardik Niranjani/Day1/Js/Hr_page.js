function submit() {
  var react = document.getElementById("reactjs").value;
  var node = document.getElementById("nodejs").value;
  var dotnet = document.getElementById("dotnet").value;
  var angular = document.getElementById("angularjs").value;

  let vacancy = JSON.parse(localStorage.getItem("vacancyData"));
  console.log(vacancy);
  if(react == ""){
      react = "0";
  }
  if(node == ""){
      node = "0";
  }
  if(dotnet == ""){
      dotnet = "0";
  }
  if(angular == ""){
      angular = "0";
  }


  localStorage.setItem(
      "vacancyData",
      JSON.stringify([
        {
          react_vacancy: react,
          node_vacancy: node,
          dotnet_vacancy: dotnet,
          angular_vacancy: angular,
        },
      ])
    );




// Clear form
document.getElementById("reactjs").value = "";
document.getElementById("nodejs").value = "";
document.getElementById("dotnet").value = "";
document.getElementById("angularjs").value = "";

alert("You have successfully add vacancy");
}
