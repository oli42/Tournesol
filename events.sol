// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.7;

contract events{

    uint[] nbrs;
    event nbrAdded(address clientAdd, uint nbr);

    function addNbr(uint nbr) external {
        nbrs.push(nbr);
        emit nbrAdded(msg.sender, nbr);
    }
}