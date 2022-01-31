//enums example1

enum color{
    red,white,orange,blue
};
let pick:color;
pick = color.red;

// Heterogeneous Enum
enum Status { 
    Active = 'ACTIVE', 
    Deactivate = 1, 
    Pending,
    numbers=1
}

//enum example 2

enum enum2 {
    Newspaper = 1,
    Newsletter,
    Magazine,
    Book
  }
  
  enum2.Magazine;   
  enum2["Magazine"];
  enum2[3];  