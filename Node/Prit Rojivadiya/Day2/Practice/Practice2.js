// 5. Write your address in one txt file and find out how many consonants are there.

const fs = require('fs');

// fs.writeFile("./files/address.txt","306, Sainath Complex, Anand nagar, Shanatdevi road, Surat, Gujarat",(error)=>{
//     if (error) throw error;
//     console.log('file created');
// });

fs.readFile("./files/address.txt","utf-8",(error,data)=>{
    let consonants = 0;
    for(let i = 0;i<data.length;i++){
        if(data[i].match(/[^aeiou, 0-9]/i)){
            // console.log(data[i]);
            consonants += 1;
        }
    }
    console.log(consonants);
})

