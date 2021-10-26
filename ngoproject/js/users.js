function userData() {
    document.getElementById("userTable").innerHTML = "";
    let user_records = new Array();
    user_records = JSON.parse(localStorage.getItem("formData")) ? JSON.parse(localStorage.getItem("formData")) : []
    if (user_records) {
        for (let i = 0; i < user_records.length; i++) {
            let row = document.createElement('tr');
            row.innerHTML = '<td>'+[i+1]+ '</td>  <td> ' + user_records[i].fname + '</td><td>' + user_records[i].lname + '</td><td>' + user_records[i].email + '</td><td>' + user_records[i].pwd;
            document.getElementById("userTable").appendChild(row);

        }
    }
}
userData()