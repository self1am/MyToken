// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * Token
 *
 * @title A fixed supply ERC20 token contract with additional features.
 * Based on ERC20 standard: https://eips.ethereum.org/EIPS/eip-20
 */
contract Token is ERC20, ERC20Burnable, Ownable {
    /**
     * Constructs the Token contract and gives all of the supply to the address
     * that deployed it. The fixed supply is 1 billion tokens with 18 decimal places.
     */
    constructor() ERC20("Token", "TOK") Ownable(msg.sender) {
        uint256 totalSupply = 1000000000 * 10 ** decimals();
        _mint(msg.sender, totalSupply);
    }

    /**
     * @dev Fallback function to prevent accidental ETH transfers
     */
    receive() external payable {
        revert("Direct ETH transfers not accepted");
    }

    fallback() external payable {
        revert("Function not found");
    }
}
