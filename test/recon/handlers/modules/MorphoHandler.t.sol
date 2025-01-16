// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Test Contracts
import {Actor} from "../../utils/Actor.sol";
import {BaseHandler} from "../../base/BaseHandler.t.sol";
import {IMorphoBase} from "../../../../src/interfaces/IMorpho.sol";
import {MarketParams} from "../../../../src/interfaces/IMorpho.sol";
import "forge-std/console.sol";

// Interfaces
// !Note importing interfaces needed to grab selectors of contract and use actor.proxy for that purpose

/// @title BalanceForwarderModuleHandler
/// @notice Handler test contract for the risk balance forwarder module actions
contract MorphoHandler is BaseHandler {
    // Note!
    // WE can use here some helper method like _getRandomActor to get random actor from the list of actors
    // Also we can use ProtocolAssertions.sol to check some invariants
    // Also we can use some hooks, _before and _after together with ghost variables to check some invariants
    // We are using instances on initialized contracts and modules from setup step here
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                      STATE VARIABLES                                      //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    uint256 public someStateVariable;
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                       GHOST VARIABLES                                     //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    uint256 public ghostVariable;
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                           ACTIONS                                         //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    // !Note: this example uses setup modifier to get random actor, also it uses actor.proxy to call the function to handle reverts, if revert happens  - nothing will be
    /*
    function enableBalanceForwarder() external withActor {
        bool success;
        bytes memory returnData;

        // Get one of the three actors randomly
        address target = address(eTST);

        (success, returnData) = actor.proxy(
            target,
            abi.encodeWithSelector(
                IBalanceForwarder.enableBalanceForwarder.selector
            )
        );

        if (success) {
            assert(true);
        }
    }
    */
    function supply(uint256 assets, address onBehalf) external withActor {
        bool success;
        bytes memory returnData;

        (success, returnData) = actor.proxy(
            address(morpho),
            abi.encodeWithSelector(IMorphoBase.supply.selector, marketParams, assets, 0, onBehalf, "")
        );

        if (success) {
            assert(true);
        }
    }

    function withdraw(uint256 assets, address onBehalf, address receiver) external withActor {
        bool success;
        bytes memory returnData;

        (success, returnData) = actor.proxy(
            address(morpho),
            abi.encodeWithSelector(IMorphoBase.withdraw.selector, marketParams, assets, 0, onBehalf, receiver)
        );

        if (success) {
            assert(true);
        }
    }

    function borrow(uint256 assets, address onBehalf, address receiver) external withActor {
        bool success;
        bytes memory returnData;

        (success, returnData) = actor.proxy(
            address(morpho),
            abi.encodeWithSelector(IMorphoBase.borrow.selector, marketParams, assets, 0, onBehalf, receiver)
        );

        if (success) {
            assert(true);
        }
    }

    function repay(uint256 assets, address onBehalf) external withActor {
        bool success;
        bytes memory returnData;

        (success, returnData) = actor.proxy(
            address(morpho),
            abi.encodeWithSelector(IMorphoBase.repay.selector, marketParams, assets, 0, onBehalf, "")
        );

        if (success) {
            assert(true);
        }
    }

    function supplyCollateral(uint256 assets, address onBehalf) external withActor {
        bool success;
        bytes memory returnData;

        (success, returnData) = actor.proxy(
            address(morpho),
            abi.encodeWithSelector(IMorphoBase.supplyCollateral.selector, marketParams, assets, onBehalf, "")
        );

        console.log("Supply collateral success: %s", success);

        if (success) {
            assert(true);
        }
    }

    function withdrawCollateral(uint256 assets, address onBehalf, address receiver) external withActor {
        bool success;
        bytes memory returnData;

        (success, returnData) = actor.proxy(
            address(morpho),
            abi.encodeWithSelector(IMorphoBase.withdrawCollateral.selector, marketParams, assets, onBehalf, receiver)
        );

        if (success) {
            assert(true);
        }
    }

    function liquidate(address borrower, uint256 seizedAssets, uint256 repaidShares) external withActor {
        bool success;
        bytes memory returnData;

        // (success, returnData) = actor.proxy(
        //     address(morpho),
        //     abi.encodeWithSelector(
        //         IMorphoBase.liquidate.selector,
        //         MarketParams({
        //             loanToken: address(loantoken),
        //             collateralToken: address(collateralToken),
        //             oracle: address(eTST),
        //             irm: address(eTST),
        //             lltv: 0
        //         }),
        //         borrower,
        //         seizedAssets,
        //         repaidShares,
        //         ""
        //     )
        // );

        if (success) {
            assert(true);
        }
    }

    function flashLoan(address token, uint256 assets) external withActor {
        bool success;
        bytes memory returnData;

        // (success, returnData) = actor.proxy(
        //     address(eTST),
        //     abi.encodeWithSelector(IMorphoBase.flashLoan.selector, token, assets, "")
        // );

        if (success) {
            assert(true);
        }
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                     ROUNDTRIP PROPERTIES                                  //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    /**
     * @notice Roundtrip properties verify that operations can return to initial states:
     *
     * 1. Deposit/Withdraw Roundtrip:
     *    - deposit(100) -> withdraw(100) = initial balance
     *
     * 2. Borrow/Repay Roundtrip:
     *    - borrow(50) -> repay(50) = zero debt
     *
     * 3. Token Exchange Roundtrip:
     *    - mint(shares) -> burn(shares) = initial state
     *
     * These properties ensure:
     * - Operations can be reversed
     * - State transitions are consistent
     * - Accounting is accurate
     * - Users can exit positions fully
     */

    /*
    function assert_BM_INVARIANT_G() external withActor {
        bool success;
        bytes memory returnData;

        if (eTST.totalBorrows() == 0) {
            uint256 balanceBefore = eTST.balanceOf(address(actor));
            (success, returnData) = actor.proxy(
                address(eTST),
                abi.encodeWithSelector(IERC4626.redeem.selector, balanceBefore, address(actor), address(actor))
            );
            _decreaseGhostShares(balanceBefore, address(actor));
            assertTrue(success, BM_INVARIANT_G);
        }
    }
    */

    ///////////////////////////////////////////////////////////////////////////////////////////////
    function someRoundtripProperties() external pure {
        // some logic here
    }

    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                           HELPERS                                         //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    function someHelperFunction() external pure {
        // some logic here
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                         OWNER ACTIONS                                     //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    function someOwnerAction() external pure {
        // some logic here
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                           HELPERS                                         //
    ///////////////////////////////////////////////////////////////////////////////////////////////
    function someHelper() external pure {
        // some logic here
    }
}
