//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

interface ProxyInterface {
    function getBalance(address) external view returns (uint256);
    function getStaked(uint256, address) external view returns (uint256);
    function getPending(uint256, address) external view returns (uint256);
}
