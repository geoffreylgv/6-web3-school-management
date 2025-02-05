# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.ts
```

# Compile and Deploy
> Please check the [Documentation](./doc/README.md)
```shell
npx hardhat compile
npx hardhat ignition deploy ignition/modules/SchoolManagement.ts --network sepolia --verify

```

TITLE: SCHOOL MANAGEMENT SYSTEM ONCHAIN

TASK: Create a school manage system fully onchain and ensure you implement the following;

1 - All neccesary functions for Staff and students are implemented. 2 - Aside the regular SMS functionalities, students should be able to pay school fees from the platform using Ether

Final Deliverables

Ensure A working smart contract developed and compiled on hardhat.

NB: Your contract you be strictly your design and thought process, feel free to add functionalities to make it robust and better.
