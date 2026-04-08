// 1. Write a function to return all duplicate elements in an array.
// Hint: Use a Set or an object to track frequency.

function findDuplicates(arr){
    let freq = {};
    arr.forEach(item => {
        freq[item] = (freq[item] || 0) + 1;
    });
    const duplicates = Object.keys(freq).filter(key => freq[key] > 1);
    return duplicates;  
}
const array = [1, 2, 3, 4, 2, 5, 1, 6];
console.log(findDuplicates(array));

// 2. Create a throttle function that limits function execution.
// Hint: Use a flag + setTimeout to control execution frequency.

function throttle(func, limit) {
    let isThrottled = false;
    return function(...args) {
        if (!isThrottled) {
            func(...args); // Simply call the function with the arguments
            isThrottled = true; // Lock the execution
            setTimeout(() => isThrottled = false, limit); // Unlock after the limit
        }
    };
}

// Example usage:
const logMessage = () => console.log("Throttled function executed!");
const throttledLogMessage = throttle(logMessage, 2000);

throttledLogMessage(); // Executes immediately
throttledLogMessage(); // Ignored as it's within the 1000ms limit

// 3. Given an array of objects, group them by a specific property.
// Hint: Use reduce() and build an object.
function groupBy(arr, property){
    return arr.reduce((groups, item) => {
        const value = item[property];
        if (!groups[value]) {
            groups[value] = [];
        }
        groups[value].push(item);
        return groups;
    }, {});
} 
const arr =
[
    { name: 'Alice', age: 25 },
    { name: 'Bob', age: 30 },
    { name: 'Charlie', age: 25 },
    { name: 'David', age: 35 },
    { name: 'Eve', age: 25 },
    { name: 'Frank', age: 30 }
]
console.log(groupBy(arr,'age'));

// 4. Write a function that retries an API call 3 times if it fails.
// Hint: Use recursion or loop with try/catch.

function retryAPI(url,retries = 3){
    return new Promise((resolve,reject) => {
        fetch(url)
        .then(res => res.json())
        .then(data => resolve(data))
        .catch(err => {
            if(retries > 0){
                console.log("retries");
                retryAPI(url,retries - 1);
            }else{
                reject(err);
            }
        });
    }); 
}
/*     retryAPI("https://jsonplaceholder.typicode.com/users")
    .then(data => console.log(data))
    .catch(err => console.log(err)); */

// 5. Create a simple event emitter with on, emit, and off methods.
// Hint: Use an object to store event names as keys and arrays of callbacks as values.

function EventEmitter(){
    this.events = {};
}
EventEmitter.prototype.on = function(eventName,callback){
    if(!this.events[eventName]){
        this.events[eventName] = [];
    }
    this.events[eventName].push(callback);
}
EventEmitter.prototype.emit = function(eventName,...args){
    if(this.events[eventName]){
        this.events[eventName].forEach(callback => callback(...args));
    }
}
EventEmitter.prototype.off = function(eventName,callback){
    if(this.events[eventName]){
        this.events[eventName] = this.events[eventName].filter(cb => cb !== callback);
    }
}
const emitter = new EventEmitter(); 
console.log(emitter.on("Madhvi"));
