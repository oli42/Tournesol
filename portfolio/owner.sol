// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

contract owner{

    address _owner;

    constructor(){
        _owner = msg.sender;
    }

    modifier ownerPriviledge(){
        require(_owner == msg.sender, "Not the owner");
        _;
    }
}