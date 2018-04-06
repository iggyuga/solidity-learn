pragma solidity ^0.4.17;

import "./library_original.sol";

// for remix import "browser/library_original.sol";

// this is how to import via remotely
// import "github.com/willitscale/solidity/library.sol";


contract TestLibrary {
    using IntExtended for uint;
    
    function testIncrement(uint _base) returns (uint) {
        return _base.increment();
        // IntExtended.increment(_base);
    }
    
    function testDecrement(uint _base) returns (uint) {
        return _base.decrement();
        // IntExtended.decrement(_base);
    }
    
    function testIncrementByValue(uint _base, uint _value) returns (uint) {
        return _base.incrementByValue(_value);
    }
    
    function testDecrementByValue(uint _base, uint _value) returns (uint) {
        return _base.decrementByValue(_value);
    }
}