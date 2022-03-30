// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

import '@openzeppelin/contracts/utils/Strings.sol';

contract libraries {

    function concatenate(string memory str1, string memory str2, uint str3) external pure returns(string memory){
        // bytes memory tmp;
        // tmp = abi.encodePacked(str1);
        string memory result = string(abi.encodePacked(str1, str2, Strings.toString(str3)));
        return (result);
    }
    
}

// abi.encodePacked strcat