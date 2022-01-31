require('dotenv').config()
const express = require('express');
const app = express();
const jwt = require('jsonwebtoken');

app.use(express.json());

let user = [
    {
      UserID: 1,
      username: "Hardik",
    },
    {
      UserID: 2,
      username: "Dilip",
    },
    {
      UserID: 3,
      username: "Kohli",
    },
  ];


app.post('/login', (req, res)=>{
    const username = req.body.username;
    var user = {name:username};

   const token= jwt.sign(user , process.env.key1)
    res.json({token: token})
})


app.get('/user',authToken, (req, res)=>{
    res.json(fees.filter(data=> data.username === req.body.username));
})


function authToken(req, res, next){
    const authHeader = req.heders['authorization']
    const token = authHeader && authHeader.spilt(' ')[1]
    if(token == null) return res.sendStatus(401);

    jwt.verify(token, process.env.key2, (req, res)=>{
        if(err) return res.sendStatus(401);
        req.user = user;
        next();
    })
}

app.listen(3002);