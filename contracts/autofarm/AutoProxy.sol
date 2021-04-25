//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./AutoInterface.sol";
import "./VaultInterface.sol";
import "../ProxyInterface.sol";

contract AutoProxy is ProxyInterface {
    AutoInterface _auto = AutoInterface(0xa184088a740c695E156F91f5cC086a06bb78b827);
    VaultInterface _vault = VaultInterface(0x0895196562C7868C5Be92459FaE7f877ED450452);

    function getBalance(address account) external override view returns (uint256) {
        return _auto.balanceOf(account);
    }

    function getStaked(uint256 vaultId, address account) external override view returns (uint256) {
        return _vault.stakedWantTokens(vaultId, account);
    }

    function getPending(uint256 vaultId, address account) external override view returns (uint256) {
        return _vault.pendingAUTO(vaultId, account);
    }
}
