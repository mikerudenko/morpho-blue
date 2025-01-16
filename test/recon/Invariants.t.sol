// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Invariant Contracts
import {BaseAssertions} from "./assertions/BaseAssertions.t.sol";
import {MorphoAssertions} from "./assertions/MorphoAssertions.t.sol";

/// @title Invariants
/// @notice Wrappers for the protocol invariants implemented in each invariants contract
/// @dev recognized by Echidna when property mode is activated

// !Note: main invariant checks goes in this file, BECAUSE functions has echidna_ prefix, which will run invariants checks
// BUT the specific logic of each invariant is implemented in the respective invariants contract - these ARE known as the ASSERTION functions in TEMPLATE/// @dev Inherits BaseInvariants that inherits HandlerAggregator

abstract contract Invariants is BaseAssertions, MorphoAssertions {
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                     BASE INVARIANTS                                       //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    // Example on Echidna invariant function
    // function echidna_BASE_INVARIANT() public returns (bool) {
    //     assert_BASE_INVARIANT_A();
    //     assert_BASE_INVARIANT_B();
    //     return true;
    // }
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                 <SOME MODULE> INVARIANTS                                   //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                     MORPHO INVARIANTS                                     //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    function echidna_MORPHO_INVARIANT() public returns (bool) {
        assert_MORPHO_MARKET_INVARIANTS();
        assert_MORPHO_SHARES_ACCOUNTING();
        assert_MORPHO_POSITION_HEALTH();
        assert_MORPHO_MARKET_TIMESTAMPS();
        assert_MORPHO_FEE_RECIPIENT_SHARES();
        assert_MORPHO_MARKET_PARAMS_CONSISTENCY();
        return true;
    }
}
