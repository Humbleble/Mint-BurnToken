// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JKTToken {
    // Public variables to store token metadata
    string public tokenName;
    string public tokenSymbol;
    uint8 public tokenDecimals;
    
    // Total supply of tokens and address of the contract owner
    uint256 private totalTokenSupply;
    address public tokenOwner;

    // Mapping to track balances of each address
    mapping(address => uint256) private balances;

    // Events emitted when token transfers occur
    event TokensTransferred(address indexed from, address indexed to, uint256 value);

    // Modifier to restrict access to functions only to the token owner
    modifier onlyTokenOwner() {
        require(msg.sender == tokenOwner, "Only the token owner can perform this action");
        _;
    }

    // Constructor to initialize token metadata and set initial supply
    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 initialSupply
    ) {
        tokenName = name;
        tokenSymbol = symbol;
        tokenDecimals = decimals;
        tokenOwner = msg.sender;
        totalTokenSupply = initialSupply * 10 ** uint256(decimals);
        
        // Mint initial supply to the contract deployer (owner)
        balances[msg.sender] = totalTokenSupply;
        emit TokensTransferred(address(0), msg.sender, totalTokenSupply);
    }

    // External function to retrieve the balance of an address
    function getBalanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    // External function to transfer tokens to a recipient
    function transferTokens(address recipient, uint256 amount) external returns (bool) {
        _transferTokens(msg.sender, recipient, amount);
        return true;
    }

    // External function for the token owner to mint new tokens
    function mintTokens(uint256 amount) external onlyTokenOwner {
        require(amount > 0, "Amount must be greater than zero");
        _mintTokens(amount);
    }

    // External function for any address to burn (destroy) their own tokens
    function burnTokens(uint256 amount) external {
        _burnTokens(msg.sender, amount);
    }

    // Internal function to transfer tokens from one address to another
    function _transferTokens(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "Sender address must be valid");
        require(recipient != address(0), "Recipient address must be valid");
        require(balances[sender] >= amount, "Insufficient balance for transfer");

        balances[sender] -= amount;
        balances[recipient] += amount;
        emit TokensTransferred(sender, recipient, amount);
    }

    // Internal function for the token owner to mint new tokens and increase total supply
    function _mintTokens(uint256 amount) internal {
        totalTokenSupply += amount;
        balances[tokenOwner] += amount;
        emit TokensTransferred(address(0), tokenOwner, amount);
    }

    // Internal function for any address to burn (destroy) their own tokens and decrease total supply
    function _burnTokens(address account, uint256 amount) internal {
        require(balances[account] >= amount, "Burn amount exceeds available balance");

        balances[account] -= amount;
        totalTokenSupply -= amount;
        emit TokensTransferred(account, address(0), amount);
    }
}