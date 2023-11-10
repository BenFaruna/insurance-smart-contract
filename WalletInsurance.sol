// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Import the InsurancePolicy contract from the same directory
import "./Insurance.sol";

// WalletInsurance contract inherits from InsurancePolicy contract
contract WalletInsurance is InsurancePolicy {
    // Constructor for WalletInsurance contract
    constructor(address _insured, uint _premium, uint _coverageAmount) InsurancePolicy(_insured, _premium, _coverageAmount) {}

    // Override the claimInsurance function
    function claimInsurance() public payable override {
        // Require that the caller is the insured
        require(msg.sender == insured, "Only the insured can claim the insurance");
        require(isActive, "The insurance must be active");

        // Transfer the coverage amount to the insured
        payable(insured).transfer(coverageAmount * 1e18);
    }
}
