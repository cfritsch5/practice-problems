let data = require("./rescuetimedata");
// console.log(data);

data.rows.forEach((row)=>{
  // console.log(row[0]);
  let mostTimeSpentOn = "";
  let maxtime = 0;
  let Productivity = 0;

  if(row[1] > maxtime){
    maxtime = row[1];
    mostTimeSpentOn = row[3];
  }
});
