// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

// import {BaseSetup} from "@chimera/BaseSetup.sol";

import {Actor} from "./utils/Actor.sol";
import {BaseTest} from "./base/BaseTest.t.sol";
// import "src/Counter.sol";

abstract contract Setup is BaseTest {
    // Counter counter;

    function _setUp() internal {
        // Deplopy EVC and needed contracts
        _deployProtocolCore();

        // Deploy vaults
        _deployVaults();
    }

    function _deployProtocolCore() internal {
        // Deploy the protocol core contract and set the vaults
    }

    function _deployVaults() internal {
        // Deploy vaults logic
    }

    function _setUpActors() internal {
        address[] memory addresses = new address[](3);
        addresses[0] = USER1;
        addresses[1] = USER2;
        addresses[2] = USER3;
    }

    function _setUpActor(
        address userAddress,
        address[] memory tokens,
        address[] memory callers
    ) internal returns (address actorAddress) {
        bool success;
        Actor _actor = new Actor(tokens, callers);
        actors[userAddress] = _actor;
        (success, ) = address(_actor).call{value: INITIAL_ETH_BALANCE}("");
        assert(success);
        actorAddress = address(_actor);
    }
}
