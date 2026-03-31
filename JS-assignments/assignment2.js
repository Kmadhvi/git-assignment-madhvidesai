/*  ==========================================
   1. Student Report System
 =============================================*/


let students = [
  { name: "Hiya", marks: [80, 70, 90] },
  { name: "Riya", marks: [40, 55, 50] },
  { name: "Ayaan", marks: [30, 35, 25] }
];

let studentReport = students.map(student => {
  let total = student.marks.reduce((sum, mark) => sum + mark, 0);
  let average = total / student.marks.length;

  let result = "";
  if (average >= 75) {
    result = "Distinction";
  } else if (average >= 50) {
    result = "Pass";
  } else {
    result = "Fail";
  }

  return {
    ...student,
    average: average,
    result: result
  };
});


console.log("========= 1. Student Report System ==========")

console.log(studentReport);

/*  ==========================================
  2: Shopping Cart Analyzer (Using rest operator)
=============================================*/

function shoppingCartAnalizer(...items){
  let totalAmount =0 ;
  let quantityOfItems = 0;
  console.log(items);

  items.forEach(item => {
    totalAmount += item.price * item.quantity;
    quantityOfItems += item.quantity
  });
  
  return {
    totalAmount,
    quantityOfItems
  }

}

const result = shoppingCartAnalizer(
  { name: "Laptop", price: 55000, quantity: 1 },
  { name: "Mobile", price: 20000, quantity: 1 },
  { name: "Mouse", price: 500, quantity: 2 },
  { name: "Keyboard", price: 1500, quantity: 1 }
);
console.log("========= 2: Shopping Cart Analyzer (Using rest operator) ==========")
console.log(result);

/*  ==========================================
  3: User Profile Updater 
=============================================*/

function userProfileUpdate(user,newCity,profession){
  return{
    ...user,
    city:newCity,
    profession:profession
  };
}

const user = {name:"Suresh",age: 37, city:"Vadodara"};
const userProfession = userProfileUpdate(user,"Delhi","Developer");
console.log("========= 3: User Profile Updater ==========")
console.log(user);
console.log(userProfession);

/*  ==========================================
  4: Product Filter & Transform 
=============================================*/

const products = [
  { name: "Laptop", price: 55000 },
  { name: "Mobile", price: 2000},
  { name: "Mouse", price: 500 },
  { name: "Keyboard", price: 100 }
];
console.log("=========   4: Product Filter & Transform  ==========")


function filterAndTransform(products){
  const filterProducts = products.filter(p => p.price >1000)
  console.log(filterProducts);
  const transformedProduct = filterProducts.map(p => ({
    ...p,
    discountedPrice: p.price * 0.10
  }))
console.log(transformedProduct);
}
filterAndTransform(products);


/*  ==========================================
  5: Dynamic Number Processor 
=============================================*/

function processNumbers(numbers){
  const evens = numbers.filter(n => n % 2 == 0)
  const odd = numbers.filter(n => n % 2 !== 0)
  
  const sumEven = evens.reduce((num , e) => num + e, 0);
  const sumOdd = odd.reduce((num , e) => num + e, 0);
  console.log("=========  5: Dynamic Number Processor   ==========")
  console.log(evens);
  console.log(odd);
  console.log(sumEven);
  console.log(sumOdd);
}
const numbers = [2,34,67,22,74,12,13,17]
processNumbers(numbers)

