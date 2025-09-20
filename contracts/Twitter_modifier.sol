// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
//1.Add a function called changeTweetLength to change max tweet length
//HINT:use newTweetlength as input for the function
//2.create a constructor function to set an owner of contract
//3.create a modifier called onlyowner
//4.use Onlyowner on the changetweetlength function

contract Twitter{
    uint16 public MAX_TWEET_LENGTH=280;
    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    
    mapping (address=>Tweet[])public tweets;
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    function changeTweetLength(uint16 newtweetlength)public onlyOwner {
       MAX_TWEET_LENGTH=newtweetlength;
    }
    modifier onlyOwner(){
        require(msg.sender==owner,"you are not the owner");
        _;
    }
    function createTweet(string memory _tweet)public {
        require(bytes(_tweet).length<=MAX_TWEET_LENGTH,"Tweet is too long");
        Tweet memory newTweet=Tweet({
            author:msg.sender,
            content:_tweet,
            timestamp:block.timestamp,
            likes:0
        });
        tweets[msg.sender].push(newTweet);
    }
    function getTweet(uint _i)public view returns(Tweet memory){
        return tweets[msg.sender][_i];
    }
    function getAllTweets(address _owner)public view returns(Tweet[] memory){
        return tweets[_owner];
    }
}