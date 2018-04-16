pragma solidity ^0.4.17;

// This file is used to understand the solidity datatypes
contract DataTypes {
    bool myBool = true;
    
    // must be divisible by 8
    // -128 - 127
    int8 myInt;
    
    // 0-255
    uint8 myUInt;
    
    // this are essentially the same, a string becomes an array of integers
    string myString;
    uint8[] myStringArr;
    
    // string[] is a nested array of integers and cannot be used currently
    function myFunc(string s) {
        
    }
    
    
    // byte is just an alias to bytes1, range 1-32 doesn't have
    // to be divisible by 8
    byte myValue;
    bytes1 myBytes1;
    bytes32 myBytes32;
    
    // Fixed point number: used for financials
    // Floating point number: used for geometery
    
    // an integer with decimal values, fixed integer of 128bits with 19 decimals
    // we can specify the number of decimals
    // This is coming in later releases
    // fixed256x8 myFixed = 1; // 255.0 this is not availble yet. FixedPointType
    // ufixed myFixed = 1;
    
    enum Action { ADD, REMOVE, UPDATE }
    
    // Action myAction = 0, enums do not map to their integer equivalents
    Action myAction = Action.ADD;
    
    address myAddress;
    
    //we only need to create a payable function if want the Value of the address
    // sender is the person interacting with the contract
    function assignAddress() {
        myAddress = msg.sender;
        myAddress.balance;
        myAddress.transfer(10);
    }
    
    //Arrays
    uint[] myIntArr = [1,2,3];
    
    function arrFunc() {
        myIntArr.push(1); //adds to array (non-fixed)
        myIntArr.length; // gets length
        myIntArr[0]; // access value
    }
    
    uint[10] myFixedArr;
    
    //Struct
    struct Account {
        uint balance; //will be defined as 0
        uint dailyLimit;
    }
    
    //instance of Account
    Account myAccount;
    
    function structFunc() {
        myAccount.balance = 100;
    }
    
    //map
    mapping (address => Account) _accounts;
    
    function () payable {
        _accounts[msg.sender].balance += msg.value;
    }
    
    function getBalance() returns (uint) {
        return _accounts[msg.sender].balance;
    }
    
    
    
    
}