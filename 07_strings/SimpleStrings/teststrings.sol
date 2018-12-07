pragma solidity ^0.5.0;

// import "browser/Strings.sol";
import "./Strings.sol";

contract TestStrings {
    
    using Strings for string;
    
    function testConcat(string memory _base) public pure returns (string memory) {
        return _base.concat("suffix");
    }
    
    function testStrPos(string memory _base) public pure returns (int) {
        return _base.strpos("t");
    }
}
