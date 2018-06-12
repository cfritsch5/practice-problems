// ;; We can use get-in for reaching into nested maps:
// user=> (def m {:username "sally"
//               :profile {:name "Sally Clojurian"
//                         :address {:city "Austin" :state "TX"}}})
// #'user/m

// user=> (get-in m [:profile :name])
// "Sally Clojurian"
// user=> (get-in m [:profile :address :city])
// "Austin"
// user=> (get-in m [:profile :address :zip-code])
// nil
// user=> (get-in m [:profile :address :zip-code] "no zip code!")
// "no zip code!

// 1
const user = {
  username:"sally",
  profile: {
    name: "Sally Clojurian",
    address: { city: "Austin", state: "TX" }
    }
  };

// 2 function stub 4. implement the function

const getIn = function (m, ks, notFound = null){
  let key = ks.shift();
  if ( m[key] === undefined) {
    return notFound;
  } else {
    if (ks.length !== 0 ) {
      return getIn(m[key], ks, notFound);
    } else {
      return m[key];
    }
  }
};

// 3 translat to JS lines 7,9,11,13
console.log(getIn(user, ["profile", "name"]));
console.log(getIn(user, ["profile", "address", "city"]));
console.log(getIn(user, ["profile", "address", "zip-code"]));
console.log(getIn(user, ["profile", "address", "zip-code"], "no zip code!"));

const getInIterative = function (m, ks, notFound = null) {
  let key = ks.shift;
  let nextLevel = m;

  for ( let i = 0 ; i < ks.length ; i++){
    if (nextLevel[key] === undefined ) {
      return notFound;
    }

    nextLevel = nextLevel[key];
    key = ks.shift();
  }
};
