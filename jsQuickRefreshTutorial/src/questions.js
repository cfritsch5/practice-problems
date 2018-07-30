const questions = {
  1:{
    question: "declare a variable in Javascript",
    answer: "var varName; OR let varName",
  },
  2:{
    question: "which is variable declaration is function scoped var or let?",
    answer: "var",
  },
  3:{
    question: "which variable declaration is block scoped var or let?",
    answer: "let",
  },
  4:{
    question: "Declare and Assign a variable",
    answer: "let i = 0 OR var = anotherVar = 'some string value' \n etc",
  },
  5:{
    question: "whats the scope if a variable is declared without a keyword let or var?",
    answer: "global \n dont do this its bad",
  },
  6:{
    question: "make an object available on the browser",
    answer: "window.myObject = myObject",
  },
  7:{
    question: "which one evaluates to true NaN === NaN OR isNaN(NaN)",
    answer: "isNaN(NaN)",
  },
  8:{
    question: "",
    answer: "",
  },
  9:{
    question: "why is {} === {} => false, but obj = {}; obj === obj evaulate to true?",
    answer: "the first version declares two unique objects, and the second is comparing the same object to itself",
  },
  10:{
    question: "write a for and a while loop that each print the numbers 1-10",
    answer: "for(let i = 1; i < 11; i++){ console.log(`${i}`)} \n let i = 1; while(i <=10){ console.log(i)}",
  },
  0:{
    question: "",
    answer: "",
  },

};

//questions
//iterate through objects keys
//create a function that prints hello world, as a functional declration
//create an anonymous function
//arrow functions - use & scope / this reference
//

export default questions;
