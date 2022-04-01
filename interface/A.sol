// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.7;

// import './B.sol';

interface IB {
    function getNbr() external view returns(uint);
    function setNbr(uint nbr) external;
}

contract A {

    address addB;

    function setNbrBfromA(address contractAdd) external{
        addB = contractAdd;
    }

    function getnbrBfromA() external view returns(uint){
        IB ptr = IB(addB);
        return ptr.getNbr();

    }

    function setNbrBfromA(uint nbr) external{
        IB ptr = IB(addB);
        ptr.setNbr(nbr);
    }
}