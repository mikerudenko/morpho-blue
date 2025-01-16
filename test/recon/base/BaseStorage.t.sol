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

import {Morpho, MarketParams} from "../../../src/Morpho.sol";
import {MarketParams} from "../../../src/interfaces/IMorpho.sol";
import {MockPriceOracle} from "../mocks/MockPriceOracle.sol";
import {TestERC20} from "../mocks/TestERC20.sol";
import {IIrm} from "../../../src/interfaces/IIrm.sol";

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

    Morpho morpho;
    TestERC20 loanToken;
    TestERC20 collateralToken;
    MockPriceOracle mockOracle;
    MarketParams marketParams;

    IIrm irm;

    address[] vaults;

    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                       EXTRA VARIABLES                                     //
    ///////////////////////////////////////////////////////////////////////////////////////////////
}
