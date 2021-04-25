//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./ProxyInterface.sol";

contract BscApi {
  mapping (address => bool) maintainers;
  mapping (string => ProxyInterface) proxies;

  modifier onlyMaintainers() {
    require(maintainers[msg.sender]);
    _;
  }

  constructor() {
    maintainers[msg.sender] = true;
  }

  function addProxy(string calldata key, ProxyInterface proxy) 
  external onlyMaintainers() {
    proxies[key] = proxy;
  }

  function getBalance(string calldata key, address account) 
  external view returns (uint256) {
    return proxies[key].getBalance(account);
  }

  function getStaked(string calldata key, uint256 pid, address account) 
  external view returns (uint256) {
    return proxies[key].getStaked(pid, account);
  }

  function getPending(string calldata key, uint256 pid, address account) 
  external view returns (uint256) {
    return proxies[key].getPending(pid, account);
  }

  function get(string calldata key, uint256 pid, address account)
  external view returns (uint256, uint256, uint256) {
    return (
      this.getBalance(key, account),
      this.getStaked(key, pid, account),
      this.getPending(key, pid, account)
    );
  }
}
