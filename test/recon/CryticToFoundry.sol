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

    function test_echidna_MORPHO_INVARIANT_0() public {
        Id id = marketParams.id();
        (
            uint256 totalSupplyAssets,
            uint256 totalSupplyShares,
            uint256 totalBorrowAssets,
            uint256 totalBorrowShares,
            uint256 lastUpdate,
            uint256 fee
        ) = morpho.market(id);

        console.log("lastUpdate: ", lastUpdate);

        vm.prank(0x0000000000000000000000000000000000020000);
        this.withdraw(
            447301751254033913445893214690834296930546521452,
            0x98B8Df2cE7C67f9A34C552Efd38bC25d1c203B12,
            0x8dc2577981163B4F3Feee98A12BFFb562CbB62db
        );
    }
}
