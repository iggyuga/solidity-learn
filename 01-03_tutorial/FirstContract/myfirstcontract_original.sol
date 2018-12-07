pragma solidity ^0.5.0;

interface Regulator {
    function loan() external returns (bool);
    function checkValue(uint amount) external returns (bool);
}

contract Bank is Regulator {
    uint private value;
    address private owner;
    
    modifier ownerFunc {
        require(owner == msg.sender, "Sender not authorized!");
        _;
    }
    
    constructor(uint amount) public {
        value = amount;
        owner = msg.sender;
    }
    
    function deposit(uint amount) public ownerFunc {
        value += amount;
    }
    
    function withdraw(uint amount) public ownerFunc {
        if (checkValue(amount)) {
            value -= amount;
        }
    }
    
    function balance() public view returns (uint) {
        return value;
    }
    
    function loan() public view returns (bool) {
        return value > 0;
    }
    
    function checkValue(uint amount) public returns (bool) {
        return value >= amount;
    }
}

contract MyFirstContract is Bank(10) {
    string private name;
    uint8 private age;
    
    function setName(string memory _name) public{
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
    function testAssert() public pure {
        assert(1 == 2);
    }
    
    function testRequire() public pure {
        require(2 == 1);
    }
    
    function testRevert() public pure {
        revert();
    }
    
    function testThrow() public pure {
        revert();

        //throw;
    }
}



