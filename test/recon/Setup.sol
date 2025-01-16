// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

// import {BaseSetup} from "@chimera/BaseSetup.sol";

import {Actor} from "./utils/Actor.sol";
import {BaseTest} from "./base/BaseTest.t.sol";
import {Morpho} from "../../src/Morpho.sol";
import {MarketParams} from "../../src/interfaces/IMorpho.sol";
import {MockPriceOracle} from "./mocks/MockPriceOracle.sol";
import {TestERC20} from "./mocks/TestERC20.sol";
// import "src/Counter.sol";

abstract contract Setup is BaseTest {
    // Counter counter;
    Morpho morpho;

    function _setUp() internal {
        _deployMorpho();
        _createMarket();
    }

    function _deployMorpho() internal {
        morpho = new Morpho(address(this));
    }

    function _createMarket() internal {
        address randomActor = _getRandomActor();
        MockPriceOracle mockOracle = new MockPriceOracle();
        TestERC20 loanToken = new TestERC20("LOAN", "Loan Token");
        TestERC20 collateralToken = new TestERC20("COLL", "Collateral Token");
        MarketParams memory marketParams = MarketParams({
            irm: address(0), // Set appropriate IRM address
            lltv: 0.75 * 1e18, // Example LLTV value
            oracle: address(mockOracle),
            loanToken: address(loanToken),
            collateralToken: address(collateralToken)
        });
        morpho.createMarket(marketParams);
    }

    function _getRandomActor() internal view returns (address) {
        address[] memory addresses = new address[](3);
        addresses[0] = USER1;
        addresses[1] = USER2;
        addresses[2] = USER3;
        return addresses[block.timestamp % addresses.length];
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
