pragma solidity ^0.4.24;

// this contract has been deployed on Ropsten - address: 0x8b2d73e65e57b79a07468f873599e4c83b8a87a3

contract Roster{

    address owner;

    // setting up owner address as the contract deployer
    constructor() public {
        owner = msg.sender;
    }

   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }

   // Person attribute
    struct Person {
        uint age;
        bytes16 fName;
        bytes16 lName;
    }

    mapping (address => Person) people;

    // make an array of people
    address[] public peopleCount;

    // event
    event personInfo(
       bytes16 fName,
       bytes16 lName,
       uint age
    );

    // set up a new person, as well as push it to the people array
    function setPerson(address _address, uint _age, bytes16 _fName, bytes16 _lName) onlyOwner public {

        people[_address].age = _age;
        people[_address].fName = _fName;
        people[_address].lName = _lName;

        peopleCount.push(_address) -1;

        // emit this person as an event
        emit personInfo(_fName, _lName, _age);
    }

    // get the array of people by address
    function getPeople() view public returns(address[]) {
        return peopleCount;
    }

    // get a specific person's age, firstName and lastName by taking a person's address
    function getPerson(address _address) view public returns (uint, bytes16, bytes16) {
        return (people[_address].age, people[_address].fName, people[_address].lName);
    }

    // return total number of people in the array
    function countPeople() view public returns (uint) {
        return peopleCount.length;
    }

}
