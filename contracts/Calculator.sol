// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
//Make a contract called calculator
//Create result variable and store the result
//create functions to add,subtract,and multiply to result
//Create a function to get result

contract Calculator{
    uint256 result=0;
    function add(uint256 num) public{
        result+=num;//result= result+1;
    }
    function subtract(uint256 num)public{
        result-=num;//result=result-num;
    }
    function multiply(uint256 num)public{
        result*=num;
    }
    function get()public view returns (uint256){
        return result;
    }
    // **Solidity Functions Overview**
// Functions in Solidity are executable units of code within a contract, used to perform operations or return values.

// **Function Visibility Specifiers**
// 1. public: Accessible from anywhere (inside/outside contract, by any address).
// 2. private: Only accessible within the contract where defined.
// 3. internal: Accessible within the contract and derived contracts (inheritance).
// 4. external: Only callable from outside the contract (e.g., by other contracts or addresses).

}