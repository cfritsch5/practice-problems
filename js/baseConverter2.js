function baseConverter(n, b) {
  if(n === 0) {
    return "";
  }
  const digits = "01234567889abcdef".split("");

  return baseConverter(Math.floor(n/b), b) + digits[n % b];
}

console.log(baseConverter(31,16));
console.log(baseConverter(31,16));

/*
n is some number so every time we divide by b we esentially move the decimal place one to the left but we remove the remainer after the decimal is dropped with Math.floor.

102/10 = 10.2
Math.floor(102/10) = 10

essentially we are finding the the base conversion for each digit at a time
*/
