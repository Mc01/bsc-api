//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

interface VaultInterface {
    function stakedWantTokens(uint256, address) external view returns (uint256);
    function pendingAUTO(uint256, address) external view returns (uint256);
}
