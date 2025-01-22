// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

// import {BaseSetup} from "@chimera/BaseSetup.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {Actor} from "./utils/Actor.sol";
import {BaseTest} from "./base/BaseTest.t.sol";
import {Morpho} from "../../src/Morpho.sol";
import {MarketParams, Id} from "../../src/interfaces/IMorpho.sol";
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
        _createMarkets();
    }

    function _deployMorpho() internal {
        morpho = new Morpho(address(msg.sender));
        current_owner = address(msg.sender);
    }

    function _createMarkets() internal {
        mockOracle = new MockPriceOracle();

        mockIRM = new MockIIrm(0.05 * 1e18);
        uint256 ltv = 0.7 * 1e18; // Example: 50% + 5% * (i + j)

        address[] memory tokenList = new address[](4);
        tokenList[0] = address(new TestERC20("ETH", "Ethereum"));
        tokenList[1] = address(new TestERC20("USDC", "USD Coin"));
        tokenList[2] = address(new TestERC20("BTC", "Bitcoin"));
        tokenList[3] = address(new TestERC20("DESO", "Decentralized Social"));

        vm.prank(current_owner);
        morpho.enableIrm(address(mockIRM));
        vm.prank(current_owner);
        morpho.enableLltv(ltv);

        for (uint256 i = 0; i < tokenList.length; i++) {
            for (uint256 j = 0; j < tokenList.length; j++) {
                if (i != j) {
                    // Randomize LLTV value using the loop index

                    MarketParams memory marketParams = MarketParams({
                        irm: address(mockIRM),
                        lltv: ltv,
                        oracle: address(mockOracle),
                        loanToken: tokenList[i],
                        collateralToken: tokenList[j]
                    });

                    if (i == tokenList.length - 1) {
                        activeMarketParams = marketParams;
                    }

                    Id id = marketParams.id();
                    marketIds.push(id);
                    tokens.push(tokenList[i]);
                    morpho.createMarket(marketParams);
                }
            }
        }
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
        address[] memory vaults = new address[](1);

        for (uint256 i; i < NUMBER_OF_ACTORS; i++) {
            // Deploy actor proxies and approve system contracts
            address _actor = _setUpActor(addresses[i], tokens, address(morpho));

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
        address[] memory _tokens,
        address caller
    ) internal returns (address actorAddress) {
        // bool success;
        Actor _actor = new Actor(_tokens, caller);
        actors[userAddress] = _actor;
        vm.deal(address(_actor), INITIAL_ETH_BALANCE);
        // (success, ) = address(_actor).call{value: INITIAL_ETH_BALANCE}("");
        // assert(success);
        actorAddress = address(_actor);
    }
}
