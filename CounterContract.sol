// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract CounterProject
{
    uint256 number;
    event Incremented(uint256 newValue);
    event Decremented(uint256 newValue);
    event Reseted(uint256 newValue);
   
   constructor (){
    number =0;
    }
    function Increment() public returns(uint256) {
        number++;
        emit Incremented(number);
        return number;
    } 
    function Decrement() public returns(uint256) {
        require(number!=0);
        number--;
         emit Decremented(number);
        return number;
    }
    function Reset() external returns(uint256){
               number=0;
         emit Reseted(number);
        return number;
    }

}