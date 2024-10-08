// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Define your ERC20 token contract
contract MyToken is ERC20 {
    // Define the global variables for balances, total supply, name, and symbol below

    // Constructor that mints the initial supply to the deployer of the contract
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }

    // Function to mint new tokens to a specified address
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    // Function to burn tokens from a specified address
    function burn(address from, uint256 amount) public {
        _burn(from, amount);
    }

    // Function to transfer tokens from the caller's address to a specified address
    function transfer(
        address to,
        uint256 amount
    ) public override returns (bool isSuccess) {
        _transfer(msg.sender, to, amount);
        return isSuccess;
    }

    // Function to approve an address to spend a certain amount of tokens on behalf of the caller
    function approve(
        address spender,
        uint256 amount
    ) public override returns (bool isSuccess) {
        _approve(msg.sender, spender, amount);
        return isSuccess;
    }

    // Function to transfer tokens from one address to another using an allowance
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public override returns (bool isSuccess) {
        _approve(from, to, amount);
        _transfer(from, to, amount);
        return isSuccess;
    }

    function getBalanceOf(
        address account
    ) public view returns (uint256 balance) {
        return (balanceOf(account));
    }
}
