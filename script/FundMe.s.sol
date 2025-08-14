// SPDX-License-Identifier: Apache License 2.0
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

/**
 * @title FundMeScript
 * @author Axel Omar Sanchez Peralta (axelshz@gmail.com)
 * @notice A script for deploying the FundMe contract
 */
contract FundMeScript is Script {
    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
