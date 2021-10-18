function getData()
{
    fetch("http://127.0.0.1:5500/Day6/Practice%20Exercise/Data.json")
    .then((result)=>{
        return result.json();
    })
    .then((res)=>{
        var data = JSON.stringify(res);
        localStorage.setItem("products",data);
        console.log(data);
    })
    .catch((error)=>{
        console.log(error);
    })
}