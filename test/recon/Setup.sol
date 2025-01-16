// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

// import {BaseSetup} from "@chimera/BaseSetup.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {Actor} from "./utils/Actor.sol";
import {BaseTest} from "./base/BaseTest.t.sol";
import {Morpho} from "../../src/Morpho.sol";
import {MarketParams} from "../../src/interfaces/IMorpho.sol";
import {MockPriceOracle} from "./mocks/MockPriceOracle.sol";
import {TestERC20} from "./mocks/TestERC20.sol";
import {MockIIrm} from "./mocks/MockIIrm.sol";
import {MathLib} from "../../src/libraries/MathLib.sol";
import {UtilsLib} from "../../src/libraries/UtilsLib.sol";
import {SharesMathLib} from "../../src/libraries/SharesMathLib.sol";
import {SafeTransferLib} from "../../src/libraries/SafeTransferLib.sol";
import {MarketParamsLib} from "../../src/libraries/MarketParamsLib.sol";
import "forge-std/console.sol";

// import "src/Counter.sol";

abstract contract Setup is BaseTest {
    using MathLib for uint128;
    using MathLib for uint256;
    using UtilsLib for uint256;
    using SharesMathLib for uint256;
    using SafeTransferLib for IERC20;
    using MarketParamsLib for MarketParams;

    // Counter counter;

    function _setUp() internal {
        _deployMorpho();
        _createMarket();
    }

    function _deployMorpho() internal {
        morpho = new Morpho(address(this));
        // vaults.push(address(morpho));
    }

    function _createMarket() internal {
        mockOracle = new MockPriceOracle();
        loanToken = new TestERC20("LOAN", "Loan Token");
        collateralToken = new TestERC20("COLL", "Collateral Token");

        irm = new MockIIrm(0.05 * 1e18);

        // Define LLTV value
        uint256 ltv = 0.75 * 1e18; // 75% LLTV

        // Enable IRM and LLTV first since we are the owner
        morpho.enableIrm(address(irm));
        morpho.enableLltv(ltv);
        vm.warp(21639562);

        marketParams = MarketParams({
            irm: address(irm),
            lltv: ltv, // Use same LTV that was enabled
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

        address[] memory tokens = new address[](2);
        tokens[0] = address(loanToken);
        tokens[1] = address(collateralToken);

        for (uint256 i; i < NUMBER_OF_ACTORS; i++) {
            // Deply actor proxies and approve system contracts
            address _actor = _setUpActor(addresses[i], tokens, vaults);

            // Mint initial balances to actors
            for (uint256 j = 0; j < tokens.length; j++) {
                TestERC20 _token = TestERC20(tokens[j]);
                _token.mint(_actor, INITIAL_BALANCE);
            }
            actorAddresses.push(_actor);
        }
    }

    function _setUpActor(
        address userAddress,
        address[] memory tokens,
        address[] memory callers
    ) internal returns (address actorAddress) {
        bool success;
        Actor _actor = new Actor(tokens, callers);
        actors[userAddress] = _actor;
        // (success, ) = address(_actor).call{value: INITIAL_ETH_BALANCE}("");
        // assert(success);
        actorAddress = address(_actor);
    }
}
