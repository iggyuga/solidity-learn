pragma solidity ^0.4.17;

contract Debugging {
    
    uint[] private vars;
    
    // looking at stack
    function assignment() public pure {
        uint myVal1 = 1;
        uint myVal2 = 2;
        assert(myVal1 == myVal2);
    }
    
    // looking at memory
    function memoryAlloc() public pure {
        string memory myString = "test";
        assert(bytes(myString).length == 10);
    }
    
    // looking at storage
    function storageAlloc() public {
        // upon hitting this, under the hood vars will be created with a 
        // size of 1, then the value 2 is assigned
        // hitting the 2nd push, the size of the array will be updated,
        // then the value of 3 is assigned
        vars.push(2);
        vars.push(3);
        assert(vars.length == 4);
    }
    
}