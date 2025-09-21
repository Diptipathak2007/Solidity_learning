// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Solidity events->events are basically something that gives you information about the blockchain

contract EventExample{
    //Add an event called "NewuserRegistered" with 2 arguments
    //user as address type
    //usernamme as string type
    //code here

    event newUserRegistered(address indexed user,string username);

    struct user{
        string username;
        uint256 age;
    }
    mapping(address=>user)public users;
    function registeredUser(string memory _username,uint256 _age)public {
        user storage newUser=users[msg.sender];
        newUser.username=_username;
        newUser.age=_age;
        emit newUserRegistered(msg.sender, _username);
    }

}