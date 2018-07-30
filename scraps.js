Array.prototype.newFunction = (inputs) => {
  let arrowAmIsecret = true;
  console.log(this); //global object??? b/c of arrow function scope?
  console.log(inputs);
  return true;
};

Array.prototype.newFunction2 = function(inputs) {
  let funcAmIsecret = true;
  console.log(this);
  console.log(inputs);
  return true;
};

[1].newFunction('arrow');
[2].newFunction2('funct');

// console.log(arrowAmIsecret, funcAmIsecret); // undefined



// recursive factorial
function recursiveFactorial(n){
  if( n === 1) return n;

  return n * recursiveFactorial(n-1);
}

console.log(recursiveFactorial(1));
console.log(recursiveFactorial(4));
