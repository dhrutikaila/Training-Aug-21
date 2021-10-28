function storedata() {
  $.getJSON("http://127.0.0.1:5500/Assets/js/alldata.json", function (result) {
    $.each(result[0], function (key, val) {
      var vals = JSON.stringify(val);

      // localStorage.setItem(key, vals);
    });
  });
}

var ttype;
$(document).ready(function () {
  //onload call------->
  tdatafun("Wireless_Speakers");

  // select drop list set onload
  // for (let i = 0; i < localStorage.length; i++) {
  //     $("#optio").append($(" <option value=" + localStorage.key(i) + ">" + localStorage.key(i) + "</option>"))
  // }
  var cl = JSON.parse(localStorage.getItem("CategoryList")).data;

  for (let i = 0; i < cl.length; i++) {
    $("#optio").append(
      $(" <option value=" + cl[i] + ">" + cl[i] + "</option>")
    );
  }

  //  select on change  from ADD Product page------------------------>
  $("#optio").change(function () {
    tdatafun(this.value);
  });

  // Add product get form data on submit------------------------------->
  $("#form").submit(function (event) {
    event.preventDefault();
    var type = $("#type").text();
    var loginForm = $("#form").serializeArray();
    var loginFormObject = {};
    $.each(loginForm, function (i, v) {
      if (v.name != "dis") {
        loginFormObject[v.name] = v.value;
      } else {
        loginFormObject[v.name] = v.value.split(",");
      }
    });

    pushdata(type, loginFormObject);
    
    $('#exampleModal').modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
  });
});

// push on localStorage --------------->
function pushdata(id, Data) {
  var tdata = JSON.parse(localStorage.getItem(id));
  tdata.data.push(Data);
  localStorage.setItem(id, JSON.stringify(tdata));
  tdatafun(id);
}

//  pushdata(1,2)

// var tdata = JSON.parse(localStorage.getItem("demo_Top_Wireless"));
// tdata.data[3]=
// delete tdata.data[2]

function tdatafun(key) {
  var datas = JSON.parse(localStorage.getItem(key));
  $("#type").text(key);
  $("#tdata").empty();
  $.each(datas.data, function (i) {
    var card = $(
      "<tr><td>" +
        (i + 1) +
        "</td><td>" +
        datas.data[i].name +
        "</td><td><img src=" +
        datas.data[i].img +
        " height='44px'></td><td>" +
        datas.data[i].price +
        "</td><td><button id='' data-bs-toggle='modal' data-bs-target='#editpanel' onclick='set_pannel(" +
        i +
        "," +
        JSON.stringify(key) +
        ")' type='button' class='btn btn-warning'><i class='fas fa-edit'></i></button></td><td><button id='del' type='button' class='btn btn-danger del' onclick='del(" +
        i +
        ")' value='" +
        i +
        "'><i class='fas fa-trash'></i></button></td></tr>"
    );
    $("#tdata").append(card);
  });
}

// delete Product  ------------------------------------------->
function deleteobj(key, id) {
  if (confirm("you want to remove data")) {
    var tdata = JSON.parse(localStorage.getItem(id));
    tdata.data.splice(key, 1);
    localStorage.setItem(id, JSON.stringify(tdata));
  }
}

function del(i) {
  var type = document.getElementById("type").innerHTML;
  deleteobj(i, type); //call deleteobj
  tdatafun(type);
}
// deleteobj(1,"demo_Top_Wireless")

// edit Product  -------------------------------------------------->
function set_pannel(i, key) {
  var temp = JSON.parse(localStorage.getItem(key));

  $("#editprice").val(temp.data[i].price);
  $("#editoldprice").val(temp.data[i].oldprice);
  $("#editdis").val(temp.data[i].dis);
  $("#editimg").val(temp.data[i].img);
  $("#editname").val(temp.data[i].name);
  $("#edsub").attr("onClick", "setobj('" + key + "'," + i + ")");
}

//  after edit save data----------------------------------------------->
function setobj(id, key, e) {
  var tdata = JSON.parse(localStorage.getItem(id));
  var loginForm = $("#editform").serializeArray();
  var editObject = {};

  $.each(loginForm, function (i, v) {
    if (v.name != "dis") {
      editObject[v.name] = v.value;
    } else {
      editObject[v.name] = v.value.split(",");
    }
  });
  tdata.data[key] = editObject;
  localStorage.setItem(id, JSON.stringify(tdata));
  tdatafun(id);
  $('#editpanel').modal('hide');
  $('body').removeClass('modal-open');
$('.modal-backdrop').remove();

  
}

// var  slider=$({data:[{'id':'Best_Sellers','title':'Upto 75% Off On Best Sellers','setid':'ifram'},
// {'id':'Prices_Like_Never_Before','title':'Prices Like Never Before','setid':'ifram'},
// {'id':'Top_Smart_Watches','title':'Top Smart Watches','setid':'imgslider'},
// {'id':'Top_Wireless','title':'Upto 75% Off On Top Wireless','setid':'New_Launches'}]})
// localStorage.setItem("slidercat",JSON.stringify(slider))
