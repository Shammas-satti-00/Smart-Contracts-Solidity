// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
contract FundMe
{   uint256 public minimumUSD;
    function fund() public payable {
        
        require(msg.value >= minimumUSD, "You need to spend more ETH!");
    }
    //function withdraw(){}    
}