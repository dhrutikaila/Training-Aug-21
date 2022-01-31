class Vacancies{
        setVacancies(DepartmentName,VacanciesNO){
        let vacancies = getJson("vacancies");
        let strData = {
                    "Department": DepartmentName,
                    "VacanciesNO": VacanciesNO
                };
        setJson(vacancies,strData,"vacancies");
        window.alert("successfully added");
        jsonTable("vacancies");
    }
}

const classObj = new Vacancies();

function getJson(jsonObj){
    let jsonData = JSON.parse(localStorage.getItem(jsonObj));
    if(!jsonData){
        let obj = {
        [jsonObj]:[]
        };
        newObj = JSON.stringify(obj);
        localStorage.setItem(jsonObj,newObj);
        return getJson(jsonObj);
    }
    return jsonData;
}

function setJson(jsonObj,jsonData,jsonKey){
    jsonObj[jsonKey].push(jsonData);   
    newJsonObj = JSON.stringify(jsonObj);
    localStorage.setItem(jsonKey,newJsonObj);
}

function jsonTable(jsonKey){
    document.getElementById('tableData').innerHTML ="";
    let jsonObj = getJson(jsonKey);
    let tbl = document.createElement('table');
    tbl.classList.add('table','table-bordered');
    let tbl_tr = document.createElement('tr');
    let heading = jsonObj[jsonKey];
    console.log(heading[0]);
    for(let row in heading[0]){
        let tbl_th = document.createElement('th');
        let tbl_th_text = document.createTextNode(row);
        tbl_th.appendChild(tbl_th_text);
        tbl_tr.appendChild(tbl_th);
    }
    tbl.appendChild(tbl_tr);
    for(let row of jsonObj[jsonKey]){
        let tblRow = document.createElement('tr');
        let tblColBtn = document.createElement('td');
        let btn = document.createElement('button');
        let btnText = document.createTextNode('remove');
        btn.classList.add('btn','btn-info');
        btn.appendChild(btnText);
        btn.onclick = () =>{
            window.script
            const  index = jsonObj[jsonKey].indexOf(row);
            let newJsonObj = jsonObj[jsonKey].splice(index, 1);
            console.log(newJsonObj)
            removeJson(newJsonObj, jsonKey);
        }
        for(let col in row){
            let tblCol = document.createElement('td');
            let tblColText = document.createTextNode(row[col]);
            tblCol.appendChild(tblColText);
            tblRow.appendChild(tblCol);

        }
        
        tblColBtn.appendChild(btn);
        tblRow.appendChild(tblColBtn);
        tbl.appendChild(tblRow);
    }
    
    document.getElementById('tableData').appendChild(tbl);
}

function removeJson(jsonObj,jsonKey){
    newJsonObj = JSON.stringify(jsonObj);
    localStorage.setItem(jsonKey,newJsonObj);
}

jsonTable("vacancies");