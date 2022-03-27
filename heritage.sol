// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

contract owner{

    address _owner;

    constructor(){
        _owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == _owner, "Not the _owner");
        _;  // to continue the calling function
    }
}

contract modif is owner {
    
    uint _nbr;


    function getNbr() public view isOwner returns(uint){
        return _nbr;
    }

    function setNbr(uint nbr) public isOwner{
       _nbr = nbr;
    }
}

// Alternative:
// import './owner.sol' 
// from a different file