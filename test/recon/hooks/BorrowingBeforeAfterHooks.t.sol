// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Contracts

// Test Helpers
import {Pretty, Strings} from "../utils/Pretty.sol";

// Test Contracts
// import {BaseHooks} from "../base/BaseHooks.t.sol";

/// @title Borrowing Before After Hooks
/// @notice Template for before and after hooks in borrowing scenarios
/// @dev This contract is inherited by handlers
///
/// IMPLEMENTATION GUIDE:
/// 1. BorrowingVars Struct:
///    Define variables to track before and after states, for example:
///    - uint256 totalBorrowsBefore;
///    - uint256 totalBorrowsAfter;
///
/// 2. Hooks Functions:
///    Implement functions to capture state before and after actions, for example:
///    function _borrowingHooksBefore() internal {
///        borrowingVars.totalBorrowsBefore = protocol.totalBorrows();
///    }
///
///    function _borrowingHooksAfter() internal {
///        borrowingVars.totalBorrowsAfter = protocol.totalBorrows();
///    }
///
/// 3. Invariant Checks:
///    Add functions to assert invariants, for example:
///    function assertTotalBorrowsInvariant() internal {
///        assertGe(borrowingVars.totalBorrowsAfter, borrowingVars.totalBorrowsBefore);
///    }
abstract contract BorrowingBeforeAfterHooks {
    using Strings for string;
    using Pretty for uint256;
    using Pretty for int256;

    struct BorrowingVars {
        // Example variables for tracking borrowing state
        uint256 totalBorrowsBefore;
        uint256 totalBorrowsAfter;
        uint256 interestRateBefore;
        uint256 interestRateAfter;
        uint256 userDebtBefore;
        uint256 userDebtAfter;
        // Add more variables as needed
    }

    BorrowingVars borrowingVars;

    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                    HOOKS FUNCTIONS                                         //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    function _borrowingHooksBefore() internal {
        // Capture state before borrowing action
        // borrowingVars.totalBorrowsBefore = protocol.totalBorrows();
        // borrowingVars.interestRateBefore = protocol.interestRate();
        // borrowingVars.userDebtBefore = protocol.debtOf(user);
    }

    function _borrowingHooksAfter() internal {
        // Capture state after borrowing action
        // borrowingVars.totalBorrowsAfter = protocol.totalBorrows();
        // borrowingVars.interestRateAfter = protocol.interestRate();
        // borrowingVars.userDebtAfter = protocol.debtOf(user);
    }

    ///////////////////////////////////////////////////////////////////////////////////////////////
    //                                POST CONDITION INVARIANTS                                  //
    ///////////////////////////////////////////////////////////////////////////////////////////////

    /* Example invariant check functions:
    function assertTotalBorrowsInvariant() internal {
        assertGe(borrowingVars.totalBorrowsAfter, borrowingVars.totalBorrowsBefore, "Total borrows invariant violated");
    }

    function assertInterestRateInvariant() internal {
        assertGe(borrowingVars.interestRateAfter, borrowingVars.interestRateBefore, "Interest rate invariant violated");
    }

    function assertUserDebtInvariant() internal {
        assertEq(borrowingVars.userDebtAfter, borrowingVars.userDebtBefore + borrowedAmount, "User debt invariant violated");
    }
    */
}
