const bSearch = function(array, target) {
  if (array.length === 0) {
    return -1;
  }
  let index = Math.floor(array.length/2);
  if (array[index] === target) {
    return index;
  } if (array[index] < target) {
    return bSearch(array.slice(0,index));
  } else {
    return bSearch(array.slice(index,target));
  }
};
