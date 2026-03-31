/*===============================================
     1. Employee Salary Processor 
 ================================================*/
const employees = [
    {name: "Suresh",salary: 40000},
    {name: "Mahesh",salary: 50000},
    {name: "Rameesh",salary: 20000},
    {name: "Kamesh",salary: 78000},
    {name: "Bahesh",salary: 80000}
];
 function employeeSalaryProcessor(employees){
    const filterSalary = employees.filter(e => e.salary >= 40000);
    console.log(filterSalary);
    const increseSalary = filterSalary.map(e=> {
        const salaryIncrese = e.salary + (e.salary * 0.10)
        return{
            ...e,
            salary :salaryIncrese,
            level : salaryIncrese >= 70000 ? 'Senior' : 'Mid'
        }
    })
    console.log("====== 1. Employee Salary Processor =============")
    console.log(increseSalary);
}
employeeSalaryProcessor(employees);

/*===============================================
2. Order Management System 
================================================*/
const orders = [
    {
        orderId: 101,
        customer: "Mahima",
        items: [
            { name: "Laptop Bag", price: 1200, quantity: 1 },
            { name: "Mouse", price: 800, quantity: 2 }
        ]
    },
    {
        orderId: 102,
        customer: "Riya",
        items: [
            { name: "Notebook", price: 100, quantity: 5 },
            { name: "Pen", price: 20, quantity: 10 }
        ]
    }
];
function orderManagementSystem(orders){
    const processOrders = orders.map(order => {
        const totalAmount = order.items.reduce((sum, item) => sum + item.price * item.quantity,0);
        const totalQuantity = order.items.reduce((sum , item) => sum + item.quantity,0);
        
        return {
            ...order,
            totalAmount,
            totalQuantity
        }
    })
    console.log("====== 2. Order Management System =============")
    processOrders.forEach(order => console.log(order));
}

 orderManagementSystem(orders);