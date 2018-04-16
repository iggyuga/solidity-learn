pragma solidity ^0.4.17;

library IntExtended {
    function increment(uint _self) pure public returns (uint) {
        return _self+1;
    }
    
    function decrement(uint _self) pure public returns (uint) {
        return _self-1;
    }
    
    function incrementByValue(uint _self, uint _value) pure public returns (uint) {
        return _self + _value;
    }
    
    function decrementByValue(uint _self, uint _value) pure public returns (uint) {
        return _self - _value;
    }
}