function moveZeros(array) {
  let indx1 = 0;
  let indx2 = 0;

  while(indx2 < array.length ){
    if(array[indx1] !== 0){
      console.log('ye','idx1:',indx1,'idx2',indx2);
      indx1++;
      indx2++;
      } else {
        indx2++;
        console.log('idx1:',indx1,'idx2',indx2);
        if(array[indx2] !== 0){
          let temp = array[indx1];
          array[indx1] = array[indx2];
          array[indx2] = array[indx1];
        }
      }
  }

  return array;
}
//1 2 0 0 0 0 3 6 8
console.log(moveZeros([1, 2, 0, 0, 0, 0, 3, 6, 8]));
