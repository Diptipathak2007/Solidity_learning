// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract Array{
    //several ways to initialize an array
    // uint[] public arr;
    // uint[] public arr1=[1,2,3];
    // //Fixed size array,all elements are initialized to zero
    // uint[10] public  myFixedSizeArr;
    // string[5] public names;
    // function get(uint i)public view returns(uint){
    //     return arr[i];
    // }
    // function getArr()public view returns (uint[]memory){
    //     return arr;
    // }

    uint[] public dynamicArray;//This is a dynamic array it can be resized
    uint[5] public fixedArray;//This is a fixed-sized array,it cannot be resized
    function addToDynamicArray(uint value)public{
        //Add a new element to the end of the array
        dynamicArray.push(value);
    }
    function getDynamicArrayLength()public view returns(uint){
        //return the length of the dynamic array
        return dynamicArray.length;
    }


}