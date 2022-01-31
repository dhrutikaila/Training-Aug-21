
export class Restaurant {


     restaurants(){
    let Restaurants:{ID:number, Name:string, Address:string,Ratings:number}[] = [
        { "ID": 0, "Name": "Dusk", "Address": "Mumbai", "Ratings":9},
        { "ID": 1, "Name": "capricorn", "Address": "kolkata", "Ratings":8},
        { "ID": 2, "Name": "alpha", "Address": "pune", "Ratings":7},
        { "ID": 3, "Name": "soham", "Address": "delhi", "Ratings":6},
        { "ID": 4, "Name": "the pink", "Address": "jaipur", "Ratings":9},
        { "ID": 5, "Name": "Atithi Dining", "Address": "indore", "Ratings":8},
      ];
      


      
      console.log("Restaurants list:");
  
      for (let i = 0; i < Restaurants.length; i++) {
          
            console.log(
              ` ${Restaurant[i].ID} ${Restaurant[i].Name}   ${Restaurant[i].Address}`
            );
        }
    }
  
}


export class tables {


tables(){
    let tables_list:{ Restaurant_ID:number, Table_Number:number, Seats:number, Available:boolean}[] = [
        { "Restaurant_ID": 0, "Table_Number": 1, "Seats": 5,Available:true},
        { "Restaurant_ID": 0, "Table_Number": 2, "Seats": 4,Available:false},
        { "Restaurant_ID": 0, "Table_Number": 3, "Seats": 6,Available:true},
        { "Restaurant_ID": 1, "Table_Number": 1, "Seats": 5,Available:true},
        { "Restaurant_ID": 1, "Table_Number": 2, "Seats": 4,Available:false},
        { "Restaurant_ID": 1, "Table_Number": 3, "Seats": 6,Available:true},
        { "Restaurant_ID": 2, "Table_Number": 1, "Seats": 3,Available:true},
        { "Restaurant_ID": 2, "Table_Number": 2, "Seats": 4,Available:false},
        { "Restaurant_ID": 2, "Table_Number": 3, "Seats": 5,Available:true},
        { "Restaurant_ID": 3, "Table_Number": 1, "Seats": 6,Available:true},
        { "Restaurant_ID": 3, "Table_Number": 2, "Seats": 5,Available:false},
        { "Restaurant_ID": 3, "Table_Number": 3, "Seats": 6,Available:false},
        { "Restaurant_ID": 4, "Table_Number": 1, "Seats": 8,Available:true},
        { "Restaurant_ID": 4, "Table_Number": 2, "Seats": 6,Available:true},
        { "Restaurant_ID": 4, "Table_Number": 3, "Seats": 7,Available:false},
        { "Restaurant_ID": 5, "Table_Number": 1, "Seats": 8,Available:true},
        { "Restaurant_ID": 5, "Table_Number": 2, "Seats": 5,Available:false},
        { "Restaurant_ID": 5, "Table_Number": 3, "Seats": 4,Available:true}
      ];


      let Tables = tables_list.filter((element=> {
        return element.Restaurant_ID== 0 && element.Available;
    }));
    
    console.log("Available tables:");
      Tables.forEach(element=>{
        console.log(`Restaurant Id: ${element.Restaurant_ID} , Table number is: ${element.Table_Number} & seats  ${element.Seats}`)
    });
    

    }
 


    
}

