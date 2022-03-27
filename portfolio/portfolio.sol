// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

import './owner.sol';

contract portfolio is owner{

    enum currency {BTC, ETH, SOL}

    struct s_account{
        uint _id;
        string _name;
        uint _cash;
        currency _curr;
    }

    uint count;

    mapping(address => s_account[]) Portfolio;

    function addAccount(address clientAdd, string memory name, uint cash, currency curr) public ownerPriviledge {
        require(currency.BTC == curr || currency.ETH == curr || currency.SOL == curr, "Currency not allowed");
        Portfolio[clientAdd].push(s_account(count, name, cash, curr));
        count++;
    }

    function getAccounts(address clientAdd) public view ownerPriviledge returns(s_account[] memory){
        return Portfolio[clientAdd];

    }

    function getNbrAccounts(address clientAdd) public view ownerPriviledge returns(uint){
        return Portfolio[clientAdd].length;
    }

    function getMyAccounts() public view returns(s_account[] memory){
        return Portfolio[msg.sender];
    }
}