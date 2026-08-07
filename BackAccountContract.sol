// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract BankAccount{

mapping (address=> uint256) public balances;
event Deposited(address indexed user, uint256 amount);
event Withdrawn(address indexed user, uint256 amount);

function deposit() public payable
{
    balances[msg.sender] = balances[msg.sender]+ msg.value;
    emit Deposited(msg.sender,msg.value);

}

function withdraw(uint256 _amount) public
{  
     require(balances[msg.sender]>=_amount,"not enough balance" );
   balances[msg.sender] -= _amount; 
(bool success, ) = msg.sender.call{value: _amount}("");
require(success, "Transfer failed");
    emit Withdrawn(msg.sender, _amount);
}

receive() external payable { 
    balances[msg.sender] = balances[msg.sender]+ msg.value;
  emit Deposited(msg.sender, msg.value);
}
}