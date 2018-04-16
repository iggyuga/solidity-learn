pragma solidity ^0.4.17;

// import "browser/Strings.sol";
import "./Strings.sol";

contract TestStrings {
    
    using Strings for string;
    
    function testConcat(string _base) public pure returns (string) {
        return _base.concat("suffix");
    }
    
    function testStrPos(string _base) public pure returns (int) {
        return _base.strpos("t");
    }
}
