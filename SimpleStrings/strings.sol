pragma solidity ^0.4.17;

library Strings {
    
    // storage types: 
    // storage: passing a value that you don't want to be cloned
    // memory: relative to the execution
    // stack: anything within a function/encapsulating
    function concat(string _base, string _value) pure internal returns (string) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        
        string memory _tmpValue = new string(_baseBytes.length + _valueBytes.length);
        
        bytes memory _newValue = bytes(_tmpValue);
        
        uint i; // iterator for the individual arrays of strings
        uint j; // iterator for _newValue
        
        for(i = 0; i<_baseBytes.length; i++) {
            _newValue[j++] = _baseBytes[i];
        }
        
        for(i = 0; i<_valueBytes.length; i++) {
            _newValue[j++] = _valueBytes[i];
        }
        
        return string(_newValue);
    }
    
    //returns negative incase not found
    function strpos(string _base, string _value) pure internal returns (int) {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        
        assert(_valueBytes.length == 1);
        
        for(uint i = 0; i<_baseBytes.length; i++) {
            if (_baseBytes[i] == _valueBytes[0]) {
                return int(i);
            }
        }
        
        return -1;
    }
    
}
