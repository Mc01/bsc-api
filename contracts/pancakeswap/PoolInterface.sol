//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

interface PoolInterface {
    function userInfo(uint256, address) external view returns (uint256);
    function pendingCake(uint256, address) external view returns (uint256);
}
