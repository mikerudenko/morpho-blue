// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Contracts
// Here should be the imports of the contracts that are going to be used in the tests

// Mock Contracts
// Here can be imports on Mock tokens, oracles, etc.

// Test Contracts
// Here can be imported Extended version of the contracts that are going to be used in the tests

// Utils
import {Actor} from "../utils/Actor.sol";

/// @notice BaseStorage contract for all test contracts, works in tandem with BaseTest
abstract contract BaseStorage {
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                       CONSTANTS                                           //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    uint256 constant MAX_TOKEN_AMOUNT = 1e29;

    uint256 constant ONE_DAY = 1 days;
    uint256 constant ONE_MONTH = ONE_YEAR / 12;
    uint256 constant ONE_YEAR = 365 days;

    uint256 internal constant NUMBER_OF_ACTORS = 3;
    uint256 internal constant INITIAL_ETH_BALANCE = 1e26;
    uint256 internal constant INITIAL_COLL_BALANCE = 1e21;

    uint256 constant VIRTUAL_DEPOSIT_AMOUNT = 1e6;

    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                          ACTORS                                           //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    /// @notice Stores the actor during a handler call
    Actor internal actor;

    /// @notice Mapping of fuzzer user addresses to actors
    mapping(address => Actor) internal actors;

    /// @notice Array of all actor addresses
    address[] internal actorAddresses;

    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                       SUITE STORAGE                                       //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    // VAULT CONTRACTS

    /// @notice Testing vaults
    // EVaultExtended internal eTST;

    // address[] vaults;

    /// @notice Permit2 contract
    address permit2;

    // ASSETS
    // ... to be added

    /// @notice mock assets
    // TestERC20 internal assetTST;

    // CONFIGURATION stuff
    // ... to be added

    /// @notice vault factory contract
    // GenericFactory internal factory;

    /// @notice SequenceRegistry contract
    address sequenceRegistry;

    // MOCKS

    /// @notice Price oracle mock contract
    // MockPriceOracle internal oracle;

    /// @notice Balance tracker mock contract
    // address balanceTracker;

    address feeReceiver;

    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                       EXTRA VARIABLES                                     //
    ///////////////////////////////////////////////////////////////////////////////////////////////
}
