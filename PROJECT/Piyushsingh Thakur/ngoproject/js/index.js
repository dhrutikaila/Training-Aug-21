var a = [
    { 'year': '2018', 'children': '10000', 'numberOfStates': '3', 'numberOfVolunteers': '389' },
    { 'year': '2019', 'children': '13789', 'numberOfStates': '7', 'numberOfVolunteers': '678' },
    { 'year': '2020', 'children': '17909', 'numberOfStates': '11', 'numberOfVolunteers': '893' },
    { 'year': '2021', 'children': '21000', 'numberOfStates': '15', 'numberOfVolunteers': '1036' }
]
localStorage.setItem("details", JSON.stringify(a));
function showData() {
    document.getElementById("myTable").innerHTML = "";
    let b = new Array();
    b = JSON.parse(localStorage.getItem("details")) ? JSON.parse(localStorage.getItem("details")) :[]
    if (b) {
        for (let i = 0; i < b.length; i++) {
            let row = document.createElement('tr');
            row.innerHTML ='<td>'+[i+1]+ '</td><td> ' + b[i].year + '</td><td>' + b[i].children + '</td><td>' + b[i].numberOfStates + '</td><td>' + b[i].numberOfVolunteers;
            document.getElementById("myTable").appendChild(row);

        }
    }
}
showData()