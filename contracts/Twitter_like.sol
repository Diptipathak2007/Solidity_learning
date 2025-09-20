// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//!.add id to tweet struct to make every tweet unique
//2.set the id to be the tweet[] length
//HINT:you do it in the createtweet function
//3.add a function to like the tweet
//HINT:there should be two praameters id and author
//4.Add a function to unlike the tweet
//HINT:make sure you can unlike only if counts is greater than 0
//5.mark both the functions external


contract Twitter{
    uint16 public MAX_TWEET_LENGTH=280;
    struct Tweet{
        uint256 id;
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
            id:tweets[msg.sender].length,
            author:msg.sender,
            content:_tweet,
            timestamp:block.timestamp,
            likes:0
        });
        tweets[msg.sender].push(newTweet);
    }
    function likeTweet(address author,uint256 id)external {
        require(tweets[author][id].id==id,"Tweet does not exist");
        tweets[author][id].likes++;
    }
    function unlikeTweet(address author,uint256 id)external {
        require(tweets[author][id].id==id,"Tweet does not exist");
        require(tweets[author][id].likes>0,"Likes are already zero");
        tweets[author][id].likes--;
    }
    function getTweet(uint _i)public view returns(Tweet memory){
        return tweets[msg.sender][_i];
    }
    function getAllTweets(address _owner)public view returns(Tweet[] memory){
        return tweets[_owner];
    }
}