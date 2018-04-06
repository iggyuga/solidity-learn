pragma solidity ^0.4.0;

interface Regulator {
    function loan() returns (bool);
    function checkValue(uint amount) returns (bool);
}

contract Bank is Regulator {
    uint private value;
    address private owner;
    
    modifier ownerFunc {
        require(owner == msg.sender);
        _;
    }
    
    function Bank(uint amount) {
        value = amount;
        owner = msg.sender;
    }
    
    function deposit(uint amount) ownerFunc {
        value += amount;
    }
    
    function withdraw(uint amount) ownerFunc {
        if (checkValue(amount)) {
            value -= amount;
        }
    }
    
    function balance() returns (uint) {
        return value;
    }
    
    function loan() returns (bool) {
        return value > 0;
    }
    
    function checkValue(uint amount) returns (bool) {
        return value >= amount;
    }
}

contract MyFirstContract is Bank(10) {
    string private name;
    uint8 private age;
    
    function setName(string _name) {
        name = _name;
    }
    
    function getName() returns (string) {
        return name;
    }
    
    function setAge(uint8 _age) {
        age = _age;
    }
    
    function getAge() returns (uint8) {
        return age;
    }
}

contract TestThrows {
    function testAssert() {
        assert(1 == 2);
    }
    
    function testRequire() {
        require(2 == 1);
    }
    
    function testRevert() {
        revert();
    }
    
    function testThrow() {
        throw;
    }
}



