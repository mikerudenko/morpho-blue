// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Contracts
import {HandlerAggregator} from "../HandlerAggregator.t.sol";
import {MorphoAssertions} from "./MorphoAssertions.t.sol";

// Types maybe used in the contract

/// @title BaseAssertions
/// @notice Implements Invariants for the protocol
/// @dev Inherits HandlerAggregator to check actions in assertion testing mode
abstract contract BaseAssertions is HandlerAggregator, MorphoAssertions {
    // !Note Example of base invariant
    // function assert_BASE_INVARIANT_A() internal {
    //     assertEq(eTST.getReentrancyLock(), false, BASE_INVARIANT_A);
    // }
    //////////////////////////////////////////////////////////////////////////////////////////////
    //                                        HELPERS                                           //
    //////////////////////////////////////////////////////////////////////////////////////////////
    // !Note Example of helper function
}
