//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./CakeInterface.sol";
import "./PoolInterface.sol";
import "../ProxyInterface.sol";

contract CakeProxy is ProxyInterface {
    CakeInterface _cake = CakeInterface(0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82);
    PoolInterface _pool = PoolInterface(0x73feaa1eE314F8c655E354234017bE2193C9E24E);

    function getBalance(address account) external override view returns (uint256) {
        return _cake.balanceOf(account);
    }

    function getStaked(uint256 poolId, address account) external override view returns (uint256) {
        return _pool.userInfo(poolId, account);
    }

    function getPending(uint256 poolId, address account) external override view returns (uint256) {
        return _pool.pendingCake(poolId, account);
    }
}
