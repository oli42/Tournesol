// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.7;

contract Fallback {

    event Log(string funcName, address sender , uint value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }

}


// if a function call fails, the contract will still receive eth, weither data exists or not.