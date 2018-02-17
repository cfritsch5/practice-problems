//make better change
//find the minimum num coins for a given amount
//its a knapsack problem -> generalized comniatorial optimization
function makeBetterChange (value, coins){
  let coinsToCheck = [];
  for(let i = 0 ; i < coins.length ; i++){
    if(coins[i] < value ){
      coinsToCheck.push(coins[i]);
    }
  }
  if(coinsToCheck.length === 0){
    return null;
  }

  let solutions = [];

  coinsToCheck.sort().reverse();

  for(let i = 0; i < coinsToCheck.length ; i++){
    let remainder = value - coinsToCheck[i];
    if(remainder > 0){
      let remaindersolution = makeBetterChange(remainder, coinsToCheck);
      if(remaindersolution.length === 0 ){
        solutions.push([coins[i]].concat(remaindersolution));
      }
    }
  }
  return solutions.sort()[0];
}
