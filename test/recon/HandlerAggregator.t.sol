// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Modules Handler Contracts
// import {BorrowingModuleHandler} from "./handlers/modules/BorrowingModuleHandler.t.sol";

// Simulators
// !note purpose of the simulator is to simulate actions that are not possible in the mainnet, hacker attacks, flash loans, etc.
import {DonationAttackHandler} from "./handlers/simulators/DonationAttackHandler.t.sol";
import {FlashLoanHandler} from "./handlers/simulators/FlashLoanHandler.t.sol";
import {IRMHandler} from "./handlers/simulators/IRMHandler.t.sol";
import {PriceOracleHandler} from "./handlers/simulators/PriceOracleHandler.t.sol";

// Morpho handlers
import {MorphoHandler} from "./handlers/modules/MorphoHandler.t.sol";

/// @notice Helper contract to aggregate all handler contracts, inherited in BaseInvariants
// BorrowingModuleHandler,
abstract contract HandlerAggregator is
    MorphoHandler,
    // Simulator handlers
    DonationAttackHandler,
    FlashLoanHandler,
    IRMHandler,
    PriceOracleHandler
{
    /// @notice Helper function in case any handler requires additional setup
    function _setUpHandlers() internal {}
}
