// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

contract mappings {

    mapping(address => uint) Balances;

    function getBalance(address myAdd) public view returns(uint){
        return Balances[myAdd];
    }
    
    receive() external payable{
        Balances[msg.sender] = msg.value;
    }
}