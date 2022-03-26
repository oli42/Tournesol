// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

contract multiple{

    address _owner;

    struct s_account{
        string _investmentType;
        uint _cash;
    }

    struct s_client{
        string _firstName;
        string _lastName;
        uint _nbrAccounts;
        mapping(uint => s_account) Accounts;
    }

    mapping(address => s_client) Clients;

    constructor() {
        _owner = msg.sender;
    }

    function addClient(address clientAdd, string memory firstName, string memory lastName) public{
        require(msg.sender == _owner, "Not the owner");
        bytes memory firstNameClientAdress = bytes(Clients[clientAdd]._firstName);
        require(firstNameClientAdress.length == 0, "Client already exists");
        Clients[clientAdd]._firstName = firstName;
        Clients[clientAdd]._lastName = lastName;
    }

    function addAccount(address clientAdd, uint cash, string memory investmentType) public{
        require(msg.sender == _owner, "Not the owner");
        bytes memory firstNameClientAdress = bytes(Clients[clientAdd]._firstName);
        require(firstNameClientAdress.length > 0, "Client doesn't exist");
        Clients[clientAdd].Accounts[Clients[clientAdd]._nbrAccounts]._investmentType = investmentType;
        Clients[clientAdd].Accounts[Clients[clientAdd]._nbrAccounts]._cash = cash;
        Clients[clientAdd]._nbrAccounts++;
    }

    function getClientTotalCash(address clientAdd) public view returns(uint) {
        uint totalCash;
        require(msg.sender == _owner, "Not the owner");
        uint totalAccounts = Clients[clientAdd]._nbrAccounts;
        for ( uint i = 0; i < totalAccounts; i++){
            totalCash += Clients[clientAdd].Accounts[i]._cash;
        }
        return totalCash;
    }

}