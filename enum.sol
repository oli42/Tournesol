// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

contract ex_enum{

    enum steps {command, sending, delivered}

    struct product {
        uint _SKU;
        ex_enum.steps _step;
    }

    mapping(address => product) CommandStatus;

    function command(address client, uint SKU) public{
        product memory p = product(SKU, steps.command);  // **
        CommandStatus[client] = p;
    }

    function sending(address client) public{
        CommandStatus[client]._step = steps.sending;
    }

     function received(address client) public{
        CommandStatus[client]._step = steps.delivered;
    }

    function getSKU(address client) public view returns(uint){
        return CommandStatus[client]._SKU;
    }

    function getStep(address client) public view returns(steps){
        return CommandStatus[client]._step;
    }

}