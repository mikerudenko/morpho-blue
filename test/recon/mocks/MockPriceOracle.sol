// SPDX-License-Identifier: GPL-2.0-or-later

pragma solidity ^0.8.0;

import "../../../src/interfaces/IOracle.sol";

contract MockPriceOracle is IOracle {
    uint256 private _price;
    uint8 public constant decimals = 18;

    function price() public view override returns (uint256) {
        // Implement the logic to return the price based on the stored prices.
        // This is a simplified example, you may need to adjust it based on your requirements.
        return _price;
    }

    function setPrice(uint256 newPrice) external {
        _price = newPrice;
    }
}
