// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Insurance abstract contract defining the basic structure of the insurance policy
abstract contract Insurance {
    // Address of the insurer (the one who created the contract)
    address public insurer;        
    // Address of the insured (the person being covered)
    address public insured;        
    // Premium amount paid by the insured
    uint public premium;           
    // The coverage amount in case of a claim
    uint public coverageAmount;    
    // Indicates if the insurance policy is active
    bool public isActive;          

    // Constructor function to set up the insurance policy
    constructor(address _insured, uint _premium, uint _coverageAmount) {
        // The creator of the contract is the insurer
        insurer = msg.sender;        
        // Set the insured's address
        insured = _insured;          
        // Set the premium amount
        premium = _premium;          
        // Set the coverage amount
        coverageAmount = _coverageAmount;  
        // The policy is initially active
        isActive = true;             
    }

    // Allows the insured to pay the premium for the insurance policy
    // The premium amount must be sent along with the transaction
    function payPremium() public payable {
        require(msg.sender == insured, "Only the insured can pay the premium");
        require(msg.value == premium, "Must pay the exact premium amount");
    }

    // Abstract function to be implemented in derived contracts
    // Used for the insured to claim insurance in case of a covered event
    function claimInsurance() public virtual;
}
