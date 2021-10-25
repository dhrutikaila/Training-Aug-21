async function storeData(){
    await fetch('http://127.0.0.1:5500/Practice/tutorialsite/data.json')
    .then((result)=>{
        
        return result.json();
    })
    .then((res)=>{
        var data = JSON.stringify(res);
        localStorage.setItem("data",data);      
    })
    .catch((error)=>{
        console.log(error);
    })

    console.log(JSON.parse(localStorage.getItem("data")).Products[0])
    
}