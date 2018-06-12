pragma solidity ^0.4.0;


// ERC20 is looking at token distribution and delegation
interface ERC20 {
    // returns the amount of tokens in circulation
    function totalSupply() external constant returns (uint _totalSupply);
    
    // returns the token balance of a specific address
    function balanceOf(address _owner) external constant returns (uint balance);
    
    // allows the transfer of tokens to someone else
    function transfer(address _to, uint _value) external returns (bool success);
    
    // anyone can specify a user to transfer tokens from to someone else
    function transferFrom(address _from, address _to, uint _value) external returns (bool success);
    
    // the token owner, gives the right to send tokens on your behalf
    function approve(address _spender, uint _value) external returns (bool success);
    
    // how much a specific eth address can manipulate another eth address
    function allowance(address _owner, address _spender) external constant returns (uint remaining);
    
    //Events
    //logging Transfers
    event Transfer(address indexed _from, address indexed _to, uint _value);
    
    //logging Approvals
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}