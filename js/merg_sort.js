//merge sort

function mergeSort(array){
  if(array.length <= 1){
    return array;
  } else {
    let mid = Math.Floor(array.length / 2);
    let left = mergeSort(array.slice(0,mid));
    let right = mergeSort(array.slice(mid));

    return merge(left,right);
  }
}

function merge(left,right){
  let sorted = [];
  while (left.length > 0 && right.length > 0 ){

    if(left[0] <= right[0]){
      sorted.push(left.shift());
    } else {
      sorted.push(right.shift());
    }
  }

  return sorted.concat(right,left);
}
