// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

contract structs {

    struct s_balance {
        uint money;
        uint nbrPayments;
    }

    mapping(address => s_balance) Balances;

    function getBalance() public view returns(uint){
        return Balances[msg.sender].money;
    }

    function getNbrPayments() public view returns(uint){
        return Balances[msg.sender].nbrPayments;
    }

    receive() external payable{
        Balances[msg.sender].money += msg.value;
        Balances[msg.sender].nbrPayments += 1;
    }
}