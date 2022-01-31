// Explain difference between var and let keyword using example. 

// let
    // Cannot be Redeclared
        let a = 5
        console.log(a)
        // let a=5
        // console.log(a)

        //ERROR--- script.js:5 Uncaught SyntaxError: Identifier 'a' has already been declared


    // Block Scope

        {
            let b = 6
            console.log(b)    //  b =  6
        }

         // console.log(b)    // not found b

    // allow
        let c = 5
        {
            let c = 7
            console.log(c) // 7
        }
        console.log(c) // 5


//var
    //  allow Redeclaration
      var aa= 3
      var aa= 5
      console.log(a)

    // no Block Scope 
    {
        var bb=65;
    }
    console.log(bb)  //65


    // ex
    var cc = 52
    {
        var cc = 73
        console.log(cc) // 73
    }
    console.log(cc) // 73
