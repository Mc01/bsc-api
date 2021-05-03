//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./CakeInterface.sol";
import "./PoolV2Interface.sol";
import "../ProxyInterface.sol";
import "../utils/SafeMath.sol";

contract CakeV2Proxy is ProxyInterface {
    using SafeMath for uint256;

    CakeInterface _cake = CakeInterface(0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82);
    PoolV2Interface _pool = PoolV2Interface(0xa80240Eb5d7E05d3F250cF000eEc0891d00b51CC);

    function getBalance(address account) external override view returns (uint256) {
        return _cake.balanceOf(account);
    }

    function getStaked(uint256, address account) external override view returns (uint256) {
        ( , , uint256 staked, ) = _pool.userInfo(account);
        return staked;
    }

    function getPending(uint256, address account) external override view returns (uint256) {
        (uint256 share, , uint256 staked, ) = _pool.userInfo(account);
        uint256 pricePerShare = _pool.getPricePerFullShare();
        return share.mul(pricePerShare).div(10 ** 18).sub(staked);
    }
}
