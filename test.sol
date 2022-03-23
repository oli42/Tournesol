// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

contract test {
    uint _nbr;
    address _myAd;

    function getNbr() public view returns(uint){
        return _nbr;
    }

    function setNbr(uint nbr) public {
        _nbr = nbr;
    }

    function getAdd() public view returns(address){
        return _myAd;
    }

    function setAdd(address add) public{
        _myAd = add;
    }
}