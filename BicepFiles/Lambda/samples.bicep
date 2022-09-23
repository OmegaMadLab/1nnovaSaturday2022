// From https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/bicep-functions-lambda

var dogs = [
  {
    name: 'Evie'
    age: 5
    interests: ['Ball', 'Frisbee']
  }
  {
    name: 'Casper'
    age: 3
    interests: ['Other dogs']
  }
  {
    name: 'Indy'
    age: 2
    interests: ['Butter']
  }
  {
    name: 'Kira'
    age: 8
    interests: ['Rubs']
  }
]

output oldDogs array = filter(dogs, dog => dog.age >=5)
// oldDogs	Array	[
//   {"name":"Evie","age":5,"interests":["Ball","Frisbee"]},
//   {"name":"Kira","age":8,"interests":["Rubs"]}
// ]

output dogNames array = map(dogs, dog => dog.name)
// dogNames	Array	[
//   "Evie",
//   "Casper",
//   "Indy",
//   "Kira"
// ]

output sayHi array = map(dogs, dog => 'Hello ${dog.name}!')
// sayHi	Array	[
//    "Hello Evie!",
//    "Hello Casper!",
//    "Hello Indy!",
//    "Hello Kira!"
// ]

var ages = map(dogs, dog => dog.age)
output totalAge int = reduce(ages, 0, (cur, prev) => cur + prev)
// totalAge	int	18

output dogsByAge array = sort(dogs, (a, b) => a.age < b.age)
// dogsByAge	Array	[
//   {"name":"Indy","age":2,"interests":["Butter"]},
//   {"name":"Casper","age":3,"interests":["Other dogs"]},
//   {"name":"Evie","age":5,"interests":["Ball","Frisbee"]},
//   {"name":"Kira","age":8,"interests":["Rubs"]}
// ]
