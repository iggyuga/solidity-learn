pragma solidity ^0.4.17;

contract Transaction {
    
    event SenderLogger(address);
    event ValueLogger(uint);
    
    address private owner;
    
    function Transaction() {
        owner = msg.sender;
    }
    
    
    
    function () payable {
        SenderLogger(msg.sender);
        ValueLogger(msg.value);
    }
    
}