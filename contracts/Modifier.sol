

//Modifier add beaviour to a function
//in the below listed code we are adding the functionality that inly owner can call the change owner function
// contract Test{
//     address public owner;
//     constructor(){
//         owner = msg.sender;
//     }
//     modifier onlyOwner(){
//         require(msg.sender==owner,"you are not the owner");
//         _;
//     }
//     function changeOwner(address newOwner)public onlyOwner{
//         owner=newOwner;
//     }
// }

//Exercise for modifiers
//add your own modifier to check if 
//person is an owner
//contract is paused

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Test {
    address public owner;
    bool public paused;

    constructor() {
        owner = msg.sender; // deployer is owner
        paused = false;     // contract starts unpaused
    }

    // Modifier: only owner can call
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Modifier: only when contract is not paused
    modifier whenNotPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    // Function to change owner (only owner can call)
    function changeOwner(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Invalid address");
        owner = _newOwner;
    }

    // Function to pause contract (only owner)
    function pauseContract() public onlyOwner {
        paused = true;
    }

    // Function to unpause contract (only owner)
    function unpauseContract() public onlyOwner {
        paused = false;
    }

    
}
