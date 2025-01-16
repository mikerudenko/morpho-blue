// SPDX-License-Identifier: GPL-2.0-or-later

pragma solidity ^0.8.0;

// Contracts
// Here should be the imports of the contracts that are going to be used in the tests

// Utils
import "../../InvariantsSpec.t.sol";
import "../../utils/StdAsserts.sol";

/// @notice Abstract contract to override functions and check internal invariants. Don't forget to inherit from real protocol contracts
abstract contract FunctionOverrides is StdAsserts, InvariantsSpec {
    uint32 internal constant INIT_OPERATION_FLAG = 1 << 31;

    /// @notice Internal invariants for low level operations
    /// @dev Similar to Postconditions but checked internally within the transaction
    function checkInvariants(address checkedAccount, address controllerEnabled) internal {
        // This is custom logic to check the internal invariants
        // assertTrue(
        //     Flags.unwrap(vaultStorage.hookedOps) & INIT_OPERATION_FLAG != 0,
        //     INTERNAL_INVARIANT_A
        // );
    }

    // Example on how to override functions and check invariants
    // function initOperation(
    //     uint32 operation,
    //     address accountToCheck
    // )
    //     internal
    //     virtual
    //     override
    //     returns (VaultCache memory vaultCache, address account)
    // {
    //     (vaultCache, account) = super.initOperation(operation, accountToCheck);
    //     vaultStorage.hookedOps = Flags.wrap(
    //         Flags.unwrap(vaultStorage.hookedOps) | INIT_OPERATION_FLAG
    //     );
    // }

    // Example on how to override functions and check invariants
    // function increaseBalance(
    //     VaultCache memory vaultCache,
    //     address account,
    //     address sender,
    //     Shares amount,
    //     Assets assets
    // ) internal virtual override {
    //     super.increaseBalance(vaultCache, account, sender, amount, assets);
    //     checkInvariants(address(0), address(0));
    // }
}
