// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import "forge-std/console2.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

import {Invariants} from "./Invariants.t.sol";
import {Setup} from "./Setup.sol";

contract CryticToFoundry is Invariants, Setup {
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
}
