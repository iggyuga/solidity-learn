pragma solidity ^0.5.0;

interface Regulator {
    function loan() external returns (bool);
    function checkValue(uint amount) external returns (bool);
}

contract Bank is Regulator {
    uint private value;
    address private owner;

    // _; represents function that is being executed but we want to enforce the modifer 1st
    modifier ownerFunc {
        require(owner == msg.sender, "Sender not authorized");
        _;
    }
    
    constructor (uint amount) public {
        value = amount;
        owner = msg.sender;
    }
    
    function deposit(uint amount) public ownerFunc  {
        value += amount;
    }
    
    function withdraw(uint amount) public ownerFunc {
        if (this.checkValue(amount)) {
            value -= amount;
        }
    }

    function checkValue(uint amount) external returns (bool) {
        return value >= amount;
    }
    
    function balance() public view returns (uint) {
        return value;
    }
    
    function loan() external returns (bool) {
        return value > 0;
    }
}

contract MyFirstContract is Bank {
    string private name;
    uint8 private age;
    
    function setName(string memory _name) public {
        name = _name;
    }
    
    function getName() public view returns (string memory) {
        return name;
    }
    
    function setAge(uint8 _age) public {
        age = _age;
    }
    
    function getAge() public view returns (uint8) {
        return age;
    }
}


contract TestThrows {

    //Assert: validating functional imports at runtime, gas is consumed
    //Require: parameter requirement (owner), gas is consumed, but will be changed to revert
    //Revert: gas is returned
    //Throw: gas is completely consumed but will be deprecated

    function testAssert() pure public {
        assert(1 == 2);
    }
    
    function testRequire() pure public {
        require(2 == 1);
    }
    
    function testRevert() pure public {
        revert();
    }
    
    function testThrow() pure public {
        //throw;
        revert();
    }
}