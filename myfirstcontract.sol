pragma solidity ^0.4.17;

interface Regulator {
    function loan() returns (bool);
    function checkValue(uint amount) returns (bool);
}

contract Bank is Regulator {
    uint private value;
    
    function Bank(uint amount) {
        value = amount;
    }
    
    function deposit(uint amount) {
        value += amount;
    }
    
    function withdraw(uint amount) {
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