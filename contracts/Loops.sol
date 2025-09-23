// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contract Counter {
//     // Function to sum numbers from 1 to `limit`
//     function countUp(uint limit) public pure returns (uint) {
//         uint sum = 0;
//         for (uint i = 1; i <= limit; i++) {
//             sum += i;
//         }
//         return sum;
//     }
// }
contract ExpenseTracker{
    struct Expense{
        address user;
        string description;
        uint amount;
    }
    Expense[] public expenses;
    constructor(){
        expenses.push(Expense(msg.sender,"Groceries",100));
        expenses.push(Expense(msg.sender,"Transportation",100));
        expenses.push(Expense(msg.sender,"Entertainment",100));
    }
    function addExpense(string memory _description,uint _amount) public{
        expenses.push(Expense(msg.sender,_description,_amount));
    }
    //create a loop to calculate all the expenses for the user
    //create a total expenses variable with uint type
    //loop over expenses array with for loop
    //add up all the expenses cost
    //return total expenses
    function getTotalExpenses(address _user)public view returns(uint){
        uint256 total=0;
        for(uint i=0;i<expenses.length;i++){
            if(expenses[i].user==_user){
                total+=expenses[i].amount;
            }
        }
        return total;
    }
}


