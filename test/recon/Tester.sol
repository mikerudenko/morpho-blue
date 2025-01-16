// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.19;

// import {TargetFunctions} from "./TargetFunctions.sol";
// import {CryticAsserts} from "@chimera/CryticAsserts.sol";
import {Invariants} from "./Invariants.t.sol";
import {Setup} from "./Setup.sol";

// echidna . --contract CryticTester --config echidna.yaml
// medusa fuzz
contract Tester is Invariants, Setup {
    constructor() {
        setUp();
    }

    /// @dev Foundry compatibility faster setup debugging
    function setUp() internal {
        // Deploy protocol contracts and protocol actors
        _setUp();

        // Deploy actors
        _setUpActors();

        // Initialize handler contracts
        _setUpHandlers();
    }
}
