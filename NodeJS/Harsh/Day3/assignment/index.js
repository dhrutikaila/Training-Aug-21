const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
})

readline.question(`What's your name?`, name => {
    console.log(`${name}`)

    readline.question(`What's your bikenumber?`, BikeNumber => {
        console.log(` ${BikeNumber}`)

        readline.question(`What's your phonenumber?`, pn => {
            console.log(`${pn}`)

            readline.question(`days?`, nd => {
                console.log(` ${nd}`)


                var cl = require("./assignment.js");

                var ob = new cl.Mobike(name, BikeNumber, pn, nd);

                ob.Compute();

            })
        })
    })
})