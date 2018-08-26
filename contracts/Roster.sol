pragma solidity ^0.4.24;

contract Roster{

    address owner;

    constructor() public {
        owner = msg.sender;
    }

   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }

    struct Instructor {
        uint age;
        string fName;
        string lName;
    }

    mapping (address => Instructor) instructors;
    address[] public instructorAccts;

    event instructorInfo(
       string fName,
       string lName,
       uint age
    );

    function setInstructor(address _address, uint _age, string _fName, string _lName) onlyOwner public {

        instructors[_address].age = _age;
        instructors[_address].fName = _fName;
        instructors[_address].lName = _lName;

        instructorAccts.push(_address) -1;
        emit instructorInfo(_fName, _lName, _age);
    }

    function getInstructors() view public returns(address[]) {
        return instructorAccts;
    }

    function getInstructor(address _address) view public returns (uint, string, string) {
        return (instructors[_address].age, instructors[_address].fName, instructors[_address].lName);
    }

    function countInstructors() view public returns (uint) {
        return instructorAccts.length;
    }

}
