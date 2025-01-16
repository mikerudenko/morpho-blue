// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title InvariantsSpec
/// @notice Invariants specification for the protocol
/// @dev Contains pseudo code and description for the invariants in the protocol
/// @dev Invariants for Token, Vault, Borrowing, Liquidations mechanics

// Note: you can modify whatever you want in this contract, it's just a helper for the tests

abstract contract InvariantsSpec {
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                          BASE                                             //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    string constant BASE_INVARIANT_A =
        "BASE_INVARIANT_A: reentrancyLock == REENTRANCY_UNLOCKED";

    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                     MORPHO INVARIANTS                                     //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    string constant MORPHO_INVARIANT_A = "MORPHO_INVARIANT_A: totalSupply should be greater than or equal to totalBorrow";
    string constant MORPHO_INVARIANT_B = "MORPHO_INVARIANT_B: totalAssets should be greater than or equal to totalSupply";
    string constant MORPHO_INVARIANT_C = "MORPHO_INVARIANT_C: totalBorrow should be less than or equal to totalAssets";
}
