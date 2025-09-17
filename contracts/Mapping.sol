// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
contract Mapping{
  //Mapping from address to uint
  mapping(address=>uint)public myMap;
  function get(address _adr)public view returns(uint){
    //Mapping always returns a value
    //If the value was never set,it will return the default value
    return myMap[_adr];
  }
  function set(address _adr,uint _i)public {
    //update the value at this addresss
    myMap[_adr]=_i;
  }
  function remove(address _adr)public{
    delete myMap[_adr];
  }
}