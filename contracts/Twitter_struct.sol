// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//1.Define a tweet struct with author,content,timestamp,likes
//2.Add the struct to an array
//3.Test Tweets
contract Twitter{
    //define our struct
    //1.use require syntax to limit the length of the tweet upto 280 characters

    uint16 constant MAX_TWEET_LENGTH=280;
    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    //add our code
    mapping (address=>Tweet[])public tweets;
    function createTweet(string memory _tweet)public {
        //condiitional
        //if tweet length<=280 then we are good,otherwise we revert
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
    //solidity require statement
    // function likeTweet(address _owner,uint _i)public{
    //     require(tweets[_owner][_i].author!=msg.sender,"You cannot like your own tweet");
    //     tweets[_owner][_i].likes++;
    // }
    
}
