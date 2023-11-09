# Insurance Project

## Description

This project is a decentralized insurance provider protocol implemented in Solidity. It features two types of insurance contracts: `WalletInsurance` and `LoanInsurance`. 

`WalletInsurance` helps owners of smart contract wallets stay protected from hackers by paying an insurance amount per month. `LoanInsurance` provides protection for crypto-backed loans when the collateral value drops.

Each contract is deployed using a factory contract model, ensuring a unique contract for each user. This gives the ability for users to pay premiums and claim insurance based on the rules set in the contracts.

## Contracts

### Insurance

This is the base contract that defines the common features for both types of insurance. It includes the features that define the insurer, insured, premium amount, coverage amount, and insurance status.

### WalletInsurance

This contract inherits from the `Insurance` contract and implements the `claimInsurance` function specific to the wallet insurance.

### LoanInsurance

This contract also inherits from the `Insurance` contract and implements the `claimInsurance` function specific to the loan insurance.

### InsuranceFactory

This contract is used to deploy `WalletInsurance` and `LoanInsurance` contracts. It maintains a mapping of insured addresses to their respective insurance contracts.

## Usage

To interact with the contracts, you need to:

1. Deploy the `InsuranceFactory` contract.
2. Use the `createWalletInsurance` or `createLoanInsurance` function of the `InsuranceFactory` contract to create a new insurance contract.
3. Use the returned contract address to interact with the specific insurance contract.

## Author

[Benjamin Faruna](https://github.com/BenFaruna/)

## License

This project is licensed under the [MIT License](LICENSE).
