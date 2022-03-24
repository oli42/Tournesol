// SPDX-License-Identifier:UNLICENSED

pragma solidity 0.8.7;

contract ex_students{

    struct s_students{
        string _name;
        uint[] notes;
    }

    mapping(address => s_students) Students;

    function addNote(address stud, uint note) public{
        return Students[stud].notes.push(note);
    } 

    function getNote(address stud) public view returns(uint[] memory){
        return Students[stud].notes;
    }

    function setName(address stud, string memory name) public{
        Students[stud]._name = name;
    }

    function getName(address stud) public view returns(string memory){
        return Students[stud]._name;
    }
}