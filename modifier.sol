// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.7;

contract modif{
    
    address _owner;
    uint _nbr;

    constructor(){
        _owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == _owner, "Not the _owner");
        _;  // to continue the calling function
    }

    function getNbr() public view isOwner returns(uint){
        return _nbr;
    }

    function setNbr(uint nbr) public isOwner{
       _nbr = nbr;
    }
}
