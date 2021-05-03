//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

interface PoolV2Interface {
    function userInfo(address) external view returns (uint256, uint256, uint256, uint256);
    function getPricePerFullShare() external view returns (uint256);
}
