// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.7;

contract Arrays_utils{

    uint[] public _tab;

    function simple() public {
        _tab = [1, 2, 3];
        delete _tab[1];
    }

    function remove(uint idx) public {
        require(idx <_tab.length, "idx out of bond");
        for(uint i = 0; i < _tab.length; i++){
            _tab[i] = _tab[i + 1];
        }
        _tab.pop();
    }

    function testingRemove() external{
        _tab = [1, 2, 3, 4, 5];
        remove(2);
        assert(_tab[0] == 1);
        assert(_tab[1] == 2);
        assert(_tab[2] == 4);
        assert(_tab[3] == 5);
        assert(_tab.length == 4);
    }
}