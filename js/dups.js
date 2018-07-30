Array.prototype.dups = function() {
  const uniqArr = "";
  for ( let i = 0; i < this.length; i++) {
    if(!uniqArr.includes(this[i])){
      uniqArr.push(this[i]);
    }
  }
  return uniqArr;
};
