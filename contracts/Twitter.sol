// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; // Solidity compiler version

// Define a smart contract named "Twitter"
contract Twitter {

    // A mapping to store tweets
    // Each Ethereum address (account) is mapped to a string (their tweet)
    // Example: 0x1234... => "Hello Blockchain"
    mapping(address => string) public tweets;

    // Function to create a tweet
    // Takes a string (_tweet) as input
    // "memory" means the string is stored temporarily during function execution
    function createTweet(string memory _tweet) public {
        // Store the tweet for the caller's address (msg.sender)
        // msg.sender is the account that called this function
        tweets[msg.sender] = _tweet;
    }
    function getTweet(address _owner)public view  returns (string memory){
        return tweets[_owner];
    }
}
