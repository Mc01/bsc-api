//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./CakeInterface.sol";
import "./PoolInterface.sol";
import "../ProxyInterface.sol";
import "../utils/SafeMath.sol";

contract CakeV2Proxy is ProxyInterface {
    using SafeMath for uint256;

    CakeInterface _cake = CakeInterface(0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82);
    PoolInterface _pool = PoolV2Interface(0xa80240eb5d7e05d3f250cf000eec0891d00b51cc);

    function getBalance(address account) external override view returns (uint256) {
        return _cake.balanceOf(account);
    }

    function getStaked(uint256 _, address account) external override view returns (uint256) {
        ( , , uint256 staked, ) = _pool.userInfo(account);
        return staked;
    }

    function getPending(uint256 _, address account) external override view returns (uint256) {
        (uint256 shares, , uint256 staked, ) = _pool.userInfo(account);
        uint256 pricePerShare = _pool.getPricePerFullShare(poolId, account);
        return ((share.mul(pricePerShare)).div(10 ** 18)).sub(staked);
    }
}
