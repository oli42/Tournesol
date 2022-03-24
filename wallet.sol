// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

contract wallet {

    struct s_wallet {
        uint _balance;
        uint _nbrPayments;
    }

    mapping(address => s_wallet) Wallets;

    function getTotalBalance() public view returns(uint){
        return address(this).balance;
    }

    function getbalance() public view returns(uint){
        return Wallets[msg.sender]._balance;
    }

    function withdrawAllMonney(address payable toAdd) public{
        uint amount = Wallets[msg.sender]._balance;
        Wallets[msg.sender]._balance = 0;
        toAdd.transfer(amount);
    }

    receive() external payable {
        Wallets[msg.sender]._balance += msg.value;
        Wallets[msg.sender]._nbrPayments += 1;
    }
}