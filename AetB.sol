// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.7;

contract A {

    address addB;

    function setNbrB(address contractAdd) external{
        addB = contractAdd;
    }

    function getnbrB() external view returns(uint){
        B ptr = B(addB);
        return ptr.getNbr();

    }

    function setNbrB(uint nbr) external{
        B ptr = B(addB);
        ptr.setNbr(nbr);
    }
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