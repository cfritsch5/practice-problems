function scoped(){
  var secret = 42;
}
// console.log(secret); //=> secret is undefined
for(var i = 0; i<3; i++){}
console.log(i); //i => 3

for(let j = 0; j < 4; j++){}
// console.log(j); //=> j is undefined

const mutable = {};
mutable['same object'] = 'but not the same content';
console.log(mutable);

const unmutable = 'cant be altered';
// unmutable = 'just try and change me'; //throws TypeError: Assignment to constant variable
console.log('unmutable',unmutable);

console.log("1 == '1'", 1 == '1');
console.log("1 === '1'", 1 === '1');
console.log({} == {});
var obj = {};
console.log(obj == obj);

let nulll = null; //null has to be specifically defined
let undefinedVar;
console.log(undefinedVar); //=> undefined
console.log(isNaN(NaN)); //=>true
console.log('3'/'o' === NaN);
console.log(NaN === NaN); //=>false
