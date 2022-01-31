require('dotenv').config()
const express = require('express');
const app = express();
const jwt = require('jsonwebtoken');

app.use(express.json());

const result = [
    {
        username:'Hardik',
        result:'pass'
    },
    {
        username:'Dilip',
        result:'pass'
    },
    {
        username:'Kohli',
        result:'Fail'
    }
];

const fees = [
    {
        username:'Hardik',
        fees:4500
    },
    {
        username:'Dilip',
        fees:5600
    },
    {
        username:'Kohli',
        fees:2350
    }
];

app.post('/login', (req, res)=>{
    const username = req.body.username;
    var user = {name:username};

   const token= jwt.sign(user , process.env.key1)
    res.json({token: token})
})

app.get('/result',authToken, (req, res)=>{
    res.json(result.filter(data=> data.username === req.body.username));
})

app.get('/fees',authToken, (req, res)=>{
    res.json(fees.filter(data=> data.username === req.body.username));
})


function authToken(req, res, next){
    const authHeader = req.heders['authorization']
    const token = authHeader && authHeader.spilt(' ')[1]
    if(token == null) return res.sendStatus(401);

    jwt.verify(token, process.env.key1, (req, res)=>{
        if(err) return res.sendStatus(401);
        req.user = user;
        next();
    })
}

app.listen(3001);