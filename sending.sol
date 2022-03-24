// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

contract sending {

    address _lastPerson;
    uint _balance;

    function getAdd() public view returns(address){
        return _lastPerson;
    }
    
    function getBalance() public view returns(uint){
        return _balance;
    } 

    receive() external payable {
        _lastPerson = msg.sender;
        _balance = _balance + msg.value;
    }
}