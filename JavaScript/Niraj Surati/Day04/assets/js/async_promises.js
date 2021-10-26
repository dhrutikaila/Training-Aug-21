function makeRequest(location){
    return new Promise((resolve,reject) => {
        console.log('Making request to '+location);
        if(location == 'Google'){
            resolve('Welcome to google');
        }else{
            reject('It doesn\'t look like google');
        }
    })
}
function processRequest(response){
    return new Promise((resolve,reject) => {
        console.log('Processing response');
        resolve('Extra information '+response);
        
    })
}

// makeRequest('Goole').then(response => {
//     console.log('Response received');
//     return processRequest(response);
// }).then(processResponse => {
//     console.log(processResponse);
// }).catch( err => {
//     console.log(err);
// });

async function doWork(){
    try{
        const response =  await setTimeout(() => {
            makeRequest('Google');
        }, 5000);
        console.log('Response received');
        const processedRequest = await processRequest(response);
        console.log(processedRequest);
    }
    catch (err){
        console.log(err);
    }
}

doWork();