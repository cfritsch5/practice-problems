function curriedSum(numArgs) {
  const numbers = [];

  function _curriedSum(num) {
    numbers.push(num);

    if(numbers.length === numArgs) {
      let total = 0;
      numbers.forEach((n)=> { total += n; });

      return total;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

/*
curried sum creates a new function scope that has some initialized variables
then defines a new function to be returned that will close over those initialized variables so that it will have access to them even when called elsewhere.
this makes use of the fact that in javascript functions are objects and can therefore
be passed around in a sense. so we can return the function we just defined to be used
elsewhere but it keeps its own little private bubble of the scope from where it was defined. in effect creating 'secret' variables that have limited accessability

in the case of this particular curried function when you call curriedSume it returns
the function _curriedSum wrapped in the bubble of scope that includes the numbers varaible. then when the subsquent calls to _curriedSum numbers are pushed into
the secret scoped variable until we have teh correct number of arguments at which
point the inner arrow function runs to actually process the arguments. 
*/
