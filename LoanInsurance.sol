// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Import the InsurancePolicy contract from the same directory
import "./Insurance.sol"; 

// LoanInsurance contract inherits from InsurancePolicy contract
contract LoanInsurance is InsurancePolicy {
    // Constructor to initialize the insurance contract
    constructor(address _insured, uint _premium, uint _coverageAmount) InsurancePolicy(_insured, _premium, _coverageAmount) {}

    // Function to allow the insured to claim the insurance
    function claimInsurance() public payable override {
        require(msg.sender == insured, "Only the insured can claim the insurance");
        require(isActive, "The insurance must be active");

        // Transfer the coverage amount to the insured
        payable(msg.sender).transfer(coverageAmount * 1e18);
    }
}
