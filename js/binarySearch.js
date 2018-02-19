const bSearch = function(target){

};

Array.prototype.bsearch = function(target){
  if (this.length === 0){
    return null;
  }
  let mid = Math.floor(this.length/2);
  if ( this[mid] === target ){
    return mid;
  } else if (this[mid] > target){
    return this.slice(0,mid).bsearch(target);
  } else {
    let result = this.slice(mid+1).bsearch(target);
    return  result ? mid + 1 + result : null;
  }
};
