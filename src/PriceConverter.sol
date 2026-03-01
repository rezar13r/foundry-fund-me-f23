// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice(AggregatorV3Interface priceFeed) internal view returns (uint256) {
        (, int256 answer,,,) = priceFeed.latestRoundData();
        require(answer > 0, "Invalid price feed answer");
        uint8 feedDecimals = priceFeed.decimals();
        require(feedDecimals <= 18, "Unsupported price feed decimals");
        return uint256(answer) * 10 ** (18 - feedDecimals);
    }

    function getConversionRate(uint256 ethAmount, AggregatorV3Interface priceFeed) internal view returns (uint256) {
        return (getPrice(priceFeed) * ethAmount) / 1 ether;
    }
}
