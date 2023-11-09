// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Import the Insurance contract from the same directory
import "./Insurance.sol";

// WalletInsurance contract inherits from Insurance contract
contract WalletInsurance is Insurance {
    // Constructor for WalletInsurance contract
    constructor(address _insured, uint _premium, uint _coverageAmount) Insurance(_insured, _premium, _coverageAmount) {}

    // Override the claimInsurance function
    function claimInsurance() public override {
        // Require that the caller is the insured
        require(msg.sender == insured, "Only the insured can claim the insurance");

        // Require that the insurance is still active
        require(isActive, "The insurance must be active");

        // Transfer the coverage amount to the insured
        payable(insured).transfer(coverageAmount);
    }
}
