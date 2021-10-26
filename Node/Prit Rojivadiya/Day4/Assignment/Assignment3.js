/* Write a Nodejs server that serves as a RESTFUL API that accepts a string as an input name and 
returns the first vowel character from the string. http://localhost:3001/vowefind?input=rita */

const http = require('http');
const url = require('url');

const server = http.createServer((req,res)=>{
    if(req.url == '/'){
        res.end();
    }else if(req.url.match(/^\/vowefind\?input=[a-zA-Z]+$/)){
        const q = url.parse(req.url,true);
        let str = q.query.input;
        // console.log(str);
        for(let i = 0;i<str.length;i++){
            if(str[i].match(/^[aeiou]$/)){
                res.end(str[i])
                break;
            }
        }
    }
})

server.listen(3001,"localhost",()=>{
    console.log('listening to port 3001');
})