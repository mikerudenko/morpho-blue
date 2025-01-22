// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
// Interfaces

// import {IERC20} from "@openzeppelin/contracts/interfaces/IERC20.sol";

// Base Contracts
import {HandlerAggregator} from "../HandlerAggregator.t.sol";
import {InvariantsSpec} from "../InvariantsSpec.t.sol";
import {Market, MarketParams, Id} from "../../../src/interfaces/IMorpho.sol";
import {IOracle} from "../../../src/interfaces/IOracle.sol";
import {ORACLE_PRICE_SCALE, MAX_FEE} from "../../../src/libraries/ConstantsLib.sol";
import {WAD} from "../../../src/libraries/MathLib.sol";
import {MathLib} from "../../../src/libraries/MathLib.sol";
import {UtilsLib} from "../../../src/libraries/UtilsLib.sol";
import {SharesMathLib} from "../../../src/libraries/SharesMathLib.sol";
import {SafeTransferLib} from "../../../src/libraries/SafeTransferLib.sol";
import {MarketParamsLib} from "../../../src/libraries/MarketParamsLib.sol";

/// @title VaultModuleAssertions
/// @notice Implements Invariants for the protocol
/// @dev Inherits HandlerAggregator to check actions in assertion testing mode

// !Note this files serves as an example how to write specific invariant assertions
abstract contract MorphoAssertions is HandlerAggregator {
    using MarketParamsLib for MarketParams;
    using MathLib for uint128;
    using MathLib for uint256;
    using UtilsLib for uint256;
    using SharesMathLib for uint256;
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                        VAULT SIMPLE                                       //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    /*function assert_VM_INVARIANT_A() internal {
        assertGe(IERC20(address(eTST.asset())).balanceOf(address(eTST)), eTST.cash(), VM_INVARIANT_A);
    }

    function assert_VM_INVARIANT_C() internal {
        if (eTST.totalAssets() == 0) {
            assertEq(eTST.totalSupply(), 0, VM_INVARIANT_C);
        }
        if (eTST.totalSupply() == 0) {
            assertEq(eTST.totalAssets(), 0, VM_INVARIANT_C);
        }
    }*/
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                      ERC4626: ASSETS                                      //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    /*function assert_ERC4626_ASSETS_INVARIANT_A() internal {
        try eTST.asset() {} catch {
            fail(ERC4626_ASSETS_INVARIANT_A);
        }
    }

    function assert_ERC4626_ASSETS_INVARIANT_B() internal {
        try eTST.totalAssets() returns (uint256 totalAssets) {
            totalAssets;
        } catch {
            fail(ERC4626_ASSETS_INVARIANT_B);
        }
    }

    function assert_ERC4626_ASSETS_INVARIANT_C() internal {
        uint256 _assets = _getRandomValue(_maxAssets());
        uint256 shares;
        bool notFirstLoop;

        for (uint256 i; i < NUMBER_OF_ACTORS; i++) {
            vm.prank(actorAddresses[i]);
            uint256 tempShares = eTST.convertToShares(_assets);

            // Compare the shares with the previous iteration expect the first one
            if (notFirstLoop) {
                assertEq(shares, tempShares, ERC4626_ASSETS_INVARIANT_C);
            } else {
                shares = tempShares;
                notFirstLoop = true;
            }
        }
    }

    function assert_ERC4626_ASSETS_INVARIANT_D() internal {
        uint256 _shares = _getRandomValue(_maxShares());
        uint256 assets;
        bool notFirstLoop;

        for (uint256 i; i < NUMBER_OF_ACTORS; i++) {
            vm.prank(actorAddresses[i]);
            uint256 tempAssets = eTST.convertToAssets(_shares);

            // Compare the shares with the previous iteration expect the first one
            if (notFirstLoop) {
                assertEq(assets, tempAssets, ERC4626_ASSETS_INVARIANT_D);
            } else {
                assets = tempAssets;
                notFirstLoop = true;
            }
        }
    }
    */
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                      ERC4626: DEPOSIT                                     //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    /*
    function assert_ERC4626_DEPOSIT_INVARIANT_A(address _account) internal {
        try eTST.maxDeposit(_account) {} catch {
            fail(ERC4626_DEPOSIT_INVARIANT_A);
        }
    }
    */
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                      ERC4626: MINT                                        //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    /*
    function assert_ERC4626_MINT_INVARIANT_A(address _account) internal {
        try eTST.maxMint(_account) {} catch {
            fail(ERC4626_MINT_INVARIANT_A);
        }
    }
    */
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                    ERC4626: WITHDRAW                                      //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    /*
    function assert_ERC4626_WITHDRAW_INVARIANT_A(address _account) internal {
        try eTST.maxWithdraw(_account) {} catch {
            fail(ERC4626_WITHDRAW_INVARIANT_A);
        }
    }
    */
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                    ERC4626: REDEEM                                        //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    // function assert_ERC4626_REDEEM_INVARIANT_A(address _account) internal {
    //     try eTST.maxRedeem(_account) {} catch {
    //         fail(ERC4626_REDEEM_INVARIANT_A);
    //     }
    // }
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                     MORPHO INVARIANTS                                     //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    // function assert_MORPHO_MARKET_INVARIANTS() internal {
    //     // Market creation invariants
    //     Id id = activeMarketParams.id();
    //     (
    //         uint256 totalSupplyAssets,
    //         uint256 totalSupplyShares,
    //         uint256 totalBorrowAssets,
    //         uint256 totalBorrowShares,
    //         uint256 lastUpdate,
    //         uint256 fee
    //     ) = morpho.market(id);

    //     assertTrue(lastUpdate != 0, "Market should be created");
    //     assertTrue(morpho.isIrmEnabled(activeMarketParams.irm), "IRM should be enabled");
    //     assertTrue(morpho.isLltvEnabled(activeMarketParams.lltv), "LLTV should be enabled");
    //     assertTrue(fee <= MAX_FEE, "Fee should not exceed max");

    //     // Market state invariants
    //     assertTrue(totalBorrowAssets <= totalSupplyAssets, "Total borrows must not exceed total supply");
    // }

    // function assert_MORPHO_SHARES_ACCOUNTING() internal {
    //     Id id = activeMarketParams.id();
    //     (
    //         uint256 totalSupplyAssets,
    //         uint256 totalSupplyShares,
    //         uint256 totalBorrowAssets,
    //         uint256 totalBorrowShares,
    //         uint256 lastUpdate,
    //         uint256 fee
    //     ) = morpho.market(id);

    //     // Supply shares accounting
    //     if (totalSupplyAssets > 0) {
    //         assertTrue(totalSupplyShares > 0, "Non-zero assets must have non-zero shares");
    //     }
    //     if (totalSupplyShares == 0) {
    //         assertTrue(totalSupplyAssets == 0, "Zero shares must have zero assets");
    //     }

    //     // Borrow shares accounting
    //     if (totalBorrowAssets > 0) {
    //         assertTrue(totalBorrowShares > 0, "Non-zero borrows must have non-zero shares");
    //     }
    //     if (totalBorrowShares == 0) {
    //         assertTrue(totalBorrowAssets == 0, "Zero borrow shares must have zero assets");
    //     }
    // }

    // function assert_MORPHO_POSITION_HEALTH() internal {
    //     address borrower = address(0); // Replace with actual borrower
    //     Id id = activeMarketParams.id();
    //     (uint256 supplyShares, uint256 borrowShares, uint256 collateral) = morpho.position(id, borrower);
    //     if (borrowShares > 0) {
    //         (
    //             uint256 totalSupplyAssets,
    //             uint256 totalSupplyShares,
    //             uint256 totalBorrowAssets,
    //             uint256 totalBorrowShares,
    //             uint256 lastUpdate,
    //             uint256 fee
    //         ) = morpho.market(id);
    //         uint256 borrowed = borrowShares.toAssetsUp(totalBorrowAssets, totalBorrowShares);
    //         uint256 collateralPrice = IOracle(activeMarketParams.oracle).price();
    //         uint256 maxBorrow = collateral.mulDivDown(collateralPrice, ORACLE_PRICE_SCALE).wMulDown(
    //             activeMarketParams.lltv
    //         );
    //         assertTrue(maxBorrow >= borrowed, "Position must maintain sufficient collateral");
    //     }

    //     assertTrue(true);
    // }

    // function assert_MORPHO_MARKET_TIMESTAMPS() internal {
    //     Id id = activeMarketParams.id();
    //     (, , , , uint256 lastUpdate, uint256 fee) = morpho.market(id);

    //     assertTrue(lastUpdate <= block.timestamp, "Market last update must not be in future");
    // }

    // function assert_MORPHO_FEE_RECIPIENT_SHARES() internal {
    //     Id id = activeMarketParams.id();
    //     address feeRecipient = morpho.feeRecipient();
    //     (, , , , , uint256 fee) = morpho.market(id);

    //     (uint256 supplyShares, uint256 borrowShares, uint256 collateral) = morpho.position(id, feeRecipient);

    //     if (fee > 0) {
    //         // Fee recipient should accumulate shares when fees are enabled
    //         assertTrue(supplyShares >= 0, "Fee recipient should have valid share balance");
    //     }
    // }

    // function assert_MORPHO_MARKET_PARAMS_CONSISTENCY() internal {
    //     Id id = activeMarketParams.id();

    //     (address _loanToken, address _collateralToken, address oracle, address _irm, uint256 lltv) = morpho
    //         .idToMarketParams(id);

    //     // Token address validations
    //     assertTrue(_loanToken != address(0), "Loan token must be set");
    //     assertTrue(_collateralToken != address(0), "Collateral token must be set");
    //     assertTrue(oracle != address(0), "Oracle must be set");
    //     assertTrue(_irm != address(0), "IRM must be set");

    //     // Numerical parameter validations
    //     assertTrue(lltv > 0, "LLTV must be positive");
    //     assertTrue(lltv < WAD, "LLTV must be less than WAD");
    //     assertTrue(morpho.isIrmEnabled(address(mockIRM)), "IRM must be enabled");
    //     assertTrue(morpho.isLltvEnabled(lltv), "LLTV must be enabled");
    // }

    // function assert_MORPHO_MARKET_CREATION() internal {
    //     Id id = activeMarketParams.id();
    //     (, , , , uint256 lastUpdate, ) = morpho.market(id);

    //     assertTrue(lastUpdate != 0, "Market should be created");
    // }

    function assert_MORPHO_INTEREST_ACCRUAL() internal {
        // Id id = activeMarketParams.id();
        // uint256 initialSupplyAssets = morpho.market(id).totalSupplyAssets;
        // uint256 initialBorrowAssets = morpho.market(id).totalBorrowAssets;
        // morpho.accrueInterest(marketParams);
        // uint256 newSupplyAssets = morpho.market(id).totalSupplyAssets;
        // uint256 newBorrowAssets = morpho.market(id).totalBorrowAssets;
        // assertTrue(newSupplyAssets >= initialSupplyAssets, "Supply assets should increase or remain the same");
        // assertTrue(newBorrowAssets >= initialBorrowAssets, "Borrow assets should increase or remain the same");
    }

    function assert_MORPHO_FEE_DISTRIBUTION() internal {
        // Id id = activeMarketParams.id();
        // address feeRecipient = morpho.feeRecipient();
        // uint256 initialFeeShares = morpho.position(id, feeRecipient).supplyShares;
        // morpho.accrueInterest(marketParams);
        // uint256 newFeeShares = morpho.position(id, feeRecipient).supplyShares;
        // assertTrue(newFeeShares >= initialFeeShares, "Fee recipient shares should increase or remain the same");
    }

    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                         UTILS                                             //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    /*
    function _maxShares() internal view returns (uint256 shares) {
        shares = eTST.totalSupply();
        shares = shares == 0 ? 1 : shares;
    }

    function _maxAssets() internal view returns (uint256 assets) {
        assets = eTST.totalAssets();
        assets = assets == 0 ? 1 : assets;
    }

    function _max_withdraw(address from) internal view virtual returns (uint256) {
        return eTST.convertToAssets(eTST.balanceOf(from)); // may be different from
        // maxWithdraw(from)
    }

    function _max_redeem(address from) internal view virtual returns (uint256) {
        return eTST.balanceOf(from); // may be different from maxRedeem(from)
    }
    */
}
