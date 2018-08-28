pragma solidity ^0.4.24;

contract Roster{

    address owner;
    
    // setting up owner address to the contract caller
    constructor() public {
        owner = msg.sender;
    }
    
   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }
   
   // instructor attribute
    struct Instructor {
        uint age;
        string fName;
        string lName;
    }

    mapping (address => Instructor) instructors;
    
    // make an array of instructors
    address[] public instructorAccts;
    
    // event
    event instructorInfo(
       string fName,
       string lName,
       uint age
    );
    
    // set up a new instructor, as well as push it to the array
    function setInstructor(address _address, uint _age, string _fName, string _lName) onlyOwner public {

        instructors[_address].age = _age;
        instructors[_address].fName = _fName;
        instructors[_address].lName = _lName;

        instructorAccts.push(_address) -1;
        
        // emit this instructor as an event
        emit instructorInfo(_fName, _lName, _age);
    }
    
    // get the array of instructors by address
    function getInstructors() view public returns(address[]) {
        return instructorAccts;
    }
    
    // get a specific instructor's age, firstName and lastName by taking instructor's address
    function getInstructor(address _address) view public returns (uint, string, string) {
        return (instructors[_address].age, instructors[_address].fName, instructors[_address].lName);
    }
    
    // return total number of instructors in the array
    function countInstructors() view public returns (uint) {
        return instructorAccts.length;
    }

}
