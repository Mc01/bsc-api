# BSC API

Binance Smart Chain On-Chain API ([Live example](https://mc01.github.io/bsc-api/))

## Contracts

API Contract:
- [0xf5cb93f18ed8bf23b00b78f2d0693aa60ca27538](https://bscscan.com/address/0xf5cb93f18ed8bf23b00b78f2d0693aa60ca27538)

Autofarm Proxy:
- [0x30689827579a4962f4ce9fff58279cc9477d42d9](https://bscscan.com/address/0x30689827579a4962f4ce9fff58279cc9477d42d9)

Pancakeswap Proxy:
- [0x4c07abea65923e7e1084595be38e0755c9b42251](https://bscscan.com/address/0x4c07abea65923e7e1084595be38e0755c9b42251)

Pancakeswap Proxy V2:
- [0x41C653634477BdBa8D6113e6dC0E1D82e1364770](https://bscscan.com/address/0x41C653634477BdBa8D6113e6dC0E1D82e1364770)

## Configuration

API first argument is key for accessing proxies:
- Autofarm Proxy under `auto` key
- Pancakeswap Proxy under `cake` key
- Pancakeswap Proxy V2 under `cake2` key

Autofarm CAKE Vault pid is 7 (full list available on Autofarm Vault contract)
Pancakeswap CAKE Pool pid is 0 (full list available on Pancakeswap Pool contract)
Pancekeswap V2 does not use pids for Pool (first argument can be omitted)

## Example usage

Check balance of CAKE token:
```
address = 0x...
BscApi.getBalance("cake", address)
```

Get staked CAKE tokens:
```
cakePoolPid = 0
address = 0x...
BscApi.getStaked("cake", cakePoolPid, address)
```

Get pending AUTO tokens:
```
cakeVaultPid = 7
address = 0x...
BscApi.getPending("auto", cakeVaultPid, address)
```

Get balance, staked and pending for CAKE:
```
cakePoolPid = 0
address = 0x...
BscApi.get("cake", cakePoolPid, address)
```

Get balance, staked and pending for CAKE V2:
```
pid = 0 (is not used)
address = 0x...
BscApi.get("cake2", pid, address)
```

## Read contract

Test it on [Etherscan](https://bscscan.com/address/0xf5cb93f18ed8bf23b00b78f2d0693aa60ca27538#readContract)

## Example implementation

With [Ethers.js](https://github.com/Mc01/bsc-api/tree/master/example#bsc-api)
