// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

contract ex_require{

    uint _nbr;

    // function setNbr(uint nbr) public {
    //     if (nbr >= 10){
    //         revert('Too big number');
    //     }
    //     _nr = nbr;
    // }

    function setNbr(uint nbr) public {
        require(nbr >= 10, "Too big number");
        _nbr = nbr;
    }

    function getNbr() public view returns(uint){
        return _nbr;
    }
}