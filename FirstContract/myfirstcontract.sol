pragma solidity ^0.4.17;

interface Regulator {
    function loan() external returns (bool);
    function checkValue(uint amount) external returns (bool);
}

contract Bank is Regulator {
    uint private value;
    
    function Bank(uint amount) public {
        value = amount;
    }
    
    function deposit(uint amount) public {
        value += amount;
    }
    
    function withdraw(uint amount) public {
        if (this.checkValue(amount)) {
            value -= amount;
        }
    }

    function checkValue(uint amount) external returns (bool) {
        return value >= amount;
    }
    
    function balance() view public returns (uint) {
        return value;
    }
    
    function loan() external returns (bool) {
        return value > 0;
    }
}

contract MyFirstContract is Bank(10) {
    string private name;
    uint8 private age;
    
    function setName(string _name) public {
        name = _name;
    }
    
    function getName() view public returns (string) {
        return name;
    }
    
    function setAge(uint8 _age) public {
        age = _age;
    }
    
    function getAge() view public returns (uint8) {
        return age;
    }
}