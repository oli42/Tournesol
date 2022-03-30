// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.7;

interface interfaceB {
    function getNbr() external view returns(uint);
    function setNbr(uint nbr) external;
}

contract B {
    uint _nbr;

    function getNbr() external view returns(uint){
        return _nbr;
    }

    function setNbr(uint nbr) external{
        _nbr = nbr;
    }

}