// Verify fot Authentication
var code = localStorage.getItem("Auth_Status");

var status1 = localStorage.getItem("status");
if (code != "logout" && status1 != "User") {
  
}else if (code != "login") {
  window.location.href = "../index.html";
} else {
  window.location.href = "home.html";
}


// get data from add_movie form

// jQuery($ => {
//   var arr = JSON.parse(localStorage.getItem('checked')) || [];
//   arr.forEach((c, i) => $('.box').eq(i).prop('checked', c));

//   $(".box").click(() => {  
//     var arr = $('.box').map((i, el) => el.checked).get();
//     localStorage.setItem("checked", JSON.stringify(arr));
//   });
// });


// get check box data into array

function add_array(){
var movie_category = new Array();

var check_box_data = document.getElementsByName("checkbox_category");

for(let i = 0; i < check_box_data.length; i++){
  if(check_box_data[i].checked){
    movie_category.push(check_box_data[i].value);
  };
};

console.log(movie_category);
}

// store image data
// function add_image(){
// var bannerImage = document.getElementById('image_file');
// var imgData = getBase64Image(bannerImage);
// localStorage.setItem("imgData", imgData);

// function getBase64Image(img) {
//   var canvas = document.createElement("canvas");
//   canvas.width = img.width;
//   canvas.height = img.height;

//   var ctx = canvas.getContext("2d");
//   ctx.drawImage(img, 0, 0);

//   var dataURL = canvas.toDataURL("image/png");

//   return dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
// }
// }


// store image in localStorage
// var form = document.getElementById('add_movie_form')

// form.addEventListener('submit', function(event) {
//   event.preventDefault()
//   var reader = new FileReader()
//   var name = document.getElementById('image_file').files[0].name
//   reader.addEventListener('load', function(){
//     if(this.result && localStorage){
//       window.localStorage.setItem(name, this.result)
//     }
//   })
//   reader.readAsDataURL(document.getElementById('image_file').files[0])
//   console.log(name)
// })

// 
function add_image(){
  var reader = new FileReader()
  var name = document.getElementById('image_file').files[0].name
  var moviename = document.getElementById('movie_series_name').value;
  console.log(name)
  reader.addEventListener('load', function(event){
    console.log(event)
    if(this.result && localStorage){
      window.localStorage.setItem("moviename",JSON.stringify({[moviename]:this.result}))
      
    }
  })
  reader.readAsDataURL(document.getElementById('image_file').files[0])
  
}

// function add_image(){
//   var reader = new FileReader();
//   var imageData = document.getElementById("image_file").files[0]
//   var images = [];
//   var image = reader.readAsDataURL(imageData);
//   images.push(image);
//   localStorage.setItem("imgData", image);
// }