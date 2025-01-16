// SPDX-License-Identifier: GPL-2.0-or-later

pragma solidity ^0.8.0;

import {FunctionOverrides} from "./FunctionOverrides.sol";

// Contracts and Libraries from protocol.

// Extended contract should have Extended suffix. If should inherit from the original contract and FunctionOverrides - our own contract.

// !Note don't forget to inherit from the original contract.
contract SomeContractExtended is FunctionOverrides {
    constructor() {}

    // !NOTE also here you can specify some custom public/external functions that are not present in the original contract - the purpose of it is to get access to some private variables or functions.
    // This stuff can be moved in separate <ContractName>PrivateGetters.sol file.

    // Examples:
    // function getReentrancyLock() external view returns (bool) {
    //     return vaultStorage.reentrancyLocked;
    // }

    // function getSnapshot() external view returns (Snapshot memory) {
    //     return snapshot;
    // }

    // !NOTE This is example how initOperation is overwritten in the extended contract.
    // function initOperation(
    //     uint32 operation,
    //     address accountToCheck
    // )
    //     internal
    //     override(Base, FunctionOverrides)
    //     returns (VaultCache memory vaultCache, address account)
    // {
    //     return FunctionOverrides.initOperation(operation, accountToCheck);
    // }

    // Example of increaseBalance override
    // function increaseBalance(
    //     VaultCache memory vaultCache,
    //     address account,
    //     address sender,
    //     Shares amount,
    //     Assets assets
    // ) internal override(BalanceUtils, FunctionOverrides) {

    // !NOTE we are always calling the FunctionOverrides function, it provide us all overwritten function, because this overwritten function can be user in many extended contracts.
    //     FunctionOverrides.increaseBalance(
    //         vaultCache,
    //         account,
    //         sender,
    //         amount,
    //         assets
    //     );
    // }
}
