pragma solidity ^0.5.0;

// Each contract has an eth address
contract Transaction {
    
    event SenderLogger(address);
    event ValueLogger(uint);
    
    // creates an owner
    address private owner;


    // sets self as the owner and must be required for transactions of this contract
    modifier isOwner {
        require(owner == msg.sender, "Sender is not authorized");
        _;
    }

    // validates the amount/value of eth
    modifier validValue {
        assert(msg.value >= 1 ether);
        _;
    }
    

    constructor() public {
        owner = msg.sender;
    }
    
    
    //This is known as a 'fallback' function, we are able to interact with this function without having to invoke it. More importantly, when the contract is created, and a value of eth is specified (1eth), we can click the (fallback) and it will send the eth to contract
    function () external payable isOwner validValue {
        emit SenderLogger(msg.sender);
        emit ValueLogger(msg.value);
    }
    
}