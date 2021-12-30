 
/// <reference path = "animal.ts" />   
/// <reference path = "dog.ts" /> 
/// <reference path = "cat.ts" />  
function AllAnimal(play:Animal.IAnimal) { 
   play.sound(); 
} 
AllAnimal(new Animal.dog());
AllAnimal(new Animal.cat());