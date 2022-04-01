// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.7;

contract testcall {

    string public _name;
    uint public _balance;
    uint public _reset;

    event Log(string message);

    constructor(string memory name, uint balance){
        _name = name;
        _balance = balance;
    }

    fallback() external payable{
        emit Log("fallback called");
    }

    function reset(string memory name, uint balance) external payable returns (bool, uint) {
        _name = name;
        _balance = balance;
        _reset++;
        return (true, _reset);
    }
}

contract Call {
    bytes public _data;

    function CallingReset(address addr) external payable {
       (bool status, bytes memory data) = addr.call{value: 111, gas: 5000} (abi.encodeWithSignature("reset(string, uint256)", "Peregrine", 8000));
       require(status, "call failed");
       _data = data;
    }

    function puff(address addr) external {
        (bool status, ) = addr.call(abi.encodeWithSignature("notexisting()"));
        require(status, "call failed");

    }
}

// fallback takes care off the call (puff). The call doesn't fail. 