pragma solidity ^0.5.0;

// import "browser/ERC20.sol";
import "./ERC20.sol";

contract MyFirstToken is ERC20 {
    string public constant symbol = "MFT";
    string public constant name = "My First Token";
    uint8 public constant decimals = 18;
    
    uint private constant __totalSupply = 1000;
    mapping (address => uint) private __balanceOf;
    mapping (address => mapping (address => uint)) private __allowances;
    
    constructor() public {
        __balanceOf[msg.sender] = __totalSupply;
    }
    
    // gets the total supply of tokens, should not change so constant 
    function totalSupply() external view returns (uint _totalSupply) {
        _totalSupply = __totalSupply;
    }
    
    // gets the balance of passed in address
    function balanceOf(address _addr) external view returns (uint balance) {
        return __balanceOf[_addr];
    }
    
    // transfers a specified balance of the person interacting with this contract 
    // to another (person) eth address
    function transfer(address _to, uint _value) external returns (bool success) {
        if (_value > 0 && _value <= this.balanceOf(msg.sender)) {
            __balanceOf[msg.sender] -= _value;
            __balanceOf[_to] += _value;
            return true;
        }
        return false;
    }
    
    // Checks the remaining tokens allowed to be transfered From is > 0,
    // Checks the value is > 0 (sanity)
    // Checks the (person/from) allowed remaining tokens is greater than the value wish to be sent
    // Checks the actual balance (from which to send) that the person actually
    // has the tokens
    function transferFrom(address _from, address _to, uint _value) external returns (bool success) {
        if (__allowances[_from][msg.sender] > 0 && _value > 0 && __allowances[_from][msg.sender] >= _value && __balanceOf[_from] >= _value) {
            __balanceOf[_from] -= _value;
            __balanceOf[_to] += _value;
            // Missed from the video
            __allowances[_from][msg.sender] -= _value;
            return true;
        }
        return false;
    }
    
    // Sets the spender amount on behalf of the person interacting with this contract
    function approve(address _spender, uint _value) external returns (bool success) {
        __allowances[msg.sender][_spender] = _value;
        return true;
    }
    
    // gives access to a spender on behalf of "another" owner
    function allowance(address _owner, address _spender) external view returns (uint remaining) {
        return __allowances[_owner][_spender];
    }
}
