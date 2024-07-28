// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract JKTToken is ERC20 {
    address public admin; // Public variable to store the address of the admin

    // Constructor to initialize the token with a name, symbol, and initial supply
    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) ERC20(_name, _symbol) {
        _mint(msg.sender, _initialSupply * (10 ** decimals())); // Mint initial supply to the contract deployer
        admin = msg.sender; // Assign the deployer as the admin
    }

    // External function for the admin to mint new tokens to a specified address
    function mint(address to, uint256 amount) external {
        require(msg.sender == admin, "Only admin can mint"); // Ensure only the admin can mint tokens
        _mint(to, amount); // Call internal function to mint tokens to the specified address
    }

    // External function for any token holder to burn (destroy) their own tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount); // Call internal function to burn tokens from the caller's balance
    }
}
