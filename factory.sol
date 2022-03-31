// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.7;

contract factory{

    Account[] pool;

    function initiateClient(uint id, uint cash) external {
        Account x = new Account(id, cash);
        pool.push(x);
        x.setAddress(address(x));
    }

    function getCashAccount(Account addr) external view returns(uint)  {
        return addr.getCashBalance();
    }

    function addCashAccount(Account addr, uint cash) external{
        addr.addCash(cash);
    }

    function checkCashBalance() public view returns(address){
         if (pool.length != 0){
            for (uint i; i < pool.length; i++) {
            uint cashBalance = pool[i].getCashBalance();
                if (cashBalance < 10 && pool[i].getStatus() == false){
                    // pool[i].setStatus(true);
                    return pool[i].getAdd();
                }
            }
        }
        revert('Not found');
    }

}

contract Account{

    uint _id;
    uint _cash;
    address _Add;
    bool _status;

    constructor(uint id, uint cash){
        _id = id;
        _cash = cash;
        // _Add = msg.sender;
        _status = false;
    }

    function setAddress(address add) external {
        _Add = add;
    }

    function getCashBalance() external view returns(uint){
        return _cash;
    }
    

    function getID()external view returns(uint){
        return _id;
    }

    function getAdd()external view returns(address){
        return _Add;
    }

    function getStatus() external view returns(bool){
        return _status;
    }


    function setStatus(bool status) external {
        _status = status;
    }

    function addCash(uint cash) external{
        require( cash >= 10, "Insufficiant refound");
        _cash += cash;
        if (_status == true)
            _status = false;
    }
}