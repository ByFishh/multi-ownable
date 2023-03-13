pragma solidity ^0.8.18;

contract Ownable {

   mapping(address => bool) public owners;

   constructor() {
      owners[msg.sender] = true;
   }

   modifier onlyOwners() {
      require(owners[msg.sender]);
      _;
   }

   function addOwner(address _address) public {
      require(owners[msg.sender]);
      owners[_address] = true;
   }

   function removeOwner(address _address) public {
      require(owners[msg.sender]);
      delete owners[_address];
   }

   function isOwner(address _address) public view returns (bool) {
      if (owners[_address]) {
         return true;
      }
      return false;
   }
}

contract TestContract is Ownable {

   uint public value;

   constructor () {
      value = 0;
   }

   function incrementValue() public onlyOwners {
      value++;
   }
}
