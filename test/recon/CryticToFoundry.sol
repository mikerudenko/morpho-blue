// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.19;

import "forge-std/console2.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

import {Invariants} from "./Invariants.t.sol";
import {Setup} from "./Setup.sol";
import {MarketParamsLib} from "../../src/libraries/MarketParamsLib.sol";
import {MarketParams} from "../../src/interfaces/IMorpho.sol";
import {Market, MarketParams, Id} from "../../src/interfaces/IMorpho.sol";

contract CryticToFoundry is Setup, Invariants {
    using MarketParamsLib for MarketParams;
    /// @dev Foundry compatibility faster setup debugging
    function setUp() public {
        // Deploy protocol contracts and protocol actors
        _setUp();

        // Deploy actors
        _setUpActors();

        // Initialize handler contracts
        _setUpHandlers();

        actor = actors[USER1];
    }

    function test_canary() public {
        console.log("Canary");
    }
}
