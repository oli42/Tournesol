// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.7;

contract pauseDestroy{

    address _owner;
    bool _status;
    uint _nbr;

    constructor() {
        _owner = msg.sender;
    }

    function setStatus(bool status) public{
        require(msg.sender == _owner, "Not the owner");
        _status = status;
    }

    function setNbr(uint nbr) public{
        require(!_status, "contract is paused");
        require(msg.sender == _owner, "Not the owner");
        _nbr  = nbr;
    }

    function getNbr() public view returns(uint){
        require(!_status, "contract is paused");
        return _nbr;
    }

    function destroy(address payable toAdd) public{
        require(msg.sender == _owner, "Not the owner");
        selfdestruct(toAdd);
    }

}