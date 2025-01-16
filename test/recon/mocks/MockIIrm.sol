// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.5.0;

import {IIrm} from "../../../src/interfaces/IIrm.sol";
import {MarketParams, Market} from "../../../src/interfaces/IMorpho.sol";

contract MockIIrm is IIrm {
    uint256 private _borrowRate;

    constructor(uint256 initialRate) {
        _borrowRate = initialRate;
    }

    function setBorrowRate(uint256 newRate) external {
        _borrowRate = newRate;
    }

    function borrowRate(MarketParams memory marketParams, Market memory market) external override returns (uint256) {
        return _borrowRate;
    }

    function borrowRateView(
        MarketParams memory marketParams,
        Market memory market
    ) external view override returns (uint256) {
        return _borrowRate;
    }
}
