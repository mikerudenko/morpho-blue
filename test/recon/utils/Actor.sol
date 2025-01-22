// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Interfaces
import {IERC20} from "forge-std/interfaces/IERC20.sol";
import {TestERC20} from "../mocks/TestERC20.sol";

import "forge-std/console2.sol";
import "forge-std/console.sol";

/// @title Actor
/// @notice Proxy contract for invariant suite actors to avoid Tester calling contracts
/// @dev This expands the flexibility of the invariant suite
contract Actor {
    /// @notice list of tokens to approve
    address[] internal tokens;
    /// @notice list of callers to approve tokens to
    address[] internal callers;

    constructor(address[] memory _tokens, address _caller) {
        tokens = _tokens;

        for (uint256 i = 0; i < tokens.length; i++) {
            TestERC20(tokens[i]).approve(_caller, type(uint256).max);
        }
    }

    /// @notice Helper function to proxy a call to a target contract, used to avoid Tester calling contracts
    function proxy(address _target, bytes memory _calldata) public returns (bool success, bytes memory returnData) {
        (success, returnData) = address(_target).call(_calldata);
    }

    /// @notice Helper function to proxy a call and value to a target contract, used to avoid Tester calling contracts
    function proxy(
        address _target,
        bytes memory _calldata,
        uint256 value
    ) public returns (bool success, bytes memory returnData) {
        (success, returnData) = address(_target).call{value: value}(_calldata);
    }

    function onMorphoFlashLoan(uint256 assets, bytes calldata data) external {
        console.log("onMorphoFlashLoan called");
    }

    // receive() external payable {}
}
