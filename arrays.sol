// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

contract arrays {

    uint[] _nbr; //storage , on the Blockchain

    function addValue(uint value) public {
        _nbr.push(value);
    }

    function updateValue(uint value, uint index) public {
        _nbr[index] = value;
    }

    function deleteValue(uint index) public{
        delete _nbr[index];
    }

    function getValue(uint index) public view returns(uint){
        return _nbr[index];
    }

    function getNbrX2() public view returns(uint[] memory){ //memory, within the function scope 
        uint[] memory nbrX2 = new uint[](_nbr.length);
        for ( uint i = 0; i < _nbr.length; i++)
            nbrX2[i] = _nbr[i] * 2;
        return nbrX2;
    }

/*    function X2(uint[] memory tab) public returns(uint[] memory){
        uint len = tab.length;
        uint[] memory X2 = new uint[](len);
          for ( uint i = 0; i < tab.length; i++)
            X2[i] = tab[i] * 2;
        return X2;
    } */
}