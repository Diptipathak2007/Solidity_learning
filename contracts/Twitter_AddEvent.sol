// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//create an event for creating tweet called tweet created
//use parameters like id,author,content,timestamp
//emit the event in the createtweet function below
//create event for liking the tweet called liked the tweet
//use parameters like liker,tweetauthor,tweetid,likecount
//emit the event in the liketweet function below

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

    //define the events here
    event Tweetcreated(uint256 id,address author,string content,uint256 timestamp);
    event Likedthetweet(address liker,address tweetauthor,uint256 tweetid,uint256 likecount);
    event Unlikedthetweet(address unliker,address tweetauthor,uint256 tweetid,uint256 likecount);
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
        emit Tweetcreated(newTweet.id,newTweet.author,newTweet.content,newTweet.timestamp);
    }
    function likeTweet(address author,uint256 id)external {
        require(tweets[author][id].id==id,"Tweet does not exist");
        tweets[author][id].likes++;
        emit Likedthetweet(msg.sender,author,id,tweets[author][id].likes);
    }
    function unlikeTweet(address author,uint256 id)external {
        require(tweets[author][id].id==id,"Tweet does not exist");
        require(tweets[author][id].likes>0,"Likes are already zero");
        tweets[author][id].likes--;
        emit Unlikedthetweet(msg.sender,author,id,tweets[author][id].likes);
    }
    function getTweet(uint _i)public view returns(Tweet memory){
        return tweets[msg.sender][_i];
    }
    function getAllTweets(address _owner)public view returns(Tweet[] memory){
        return tweets[_owner];
    }
}
