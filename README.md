# BSC API

Binance Smart Chain On-Chain API ([Live example](https://mc01.github.io/bsc-api/))

## Contracts

API Contract:
- [0xf5cb93f18ed8bf23b00b78f2d0693aa60ca27538](https://bscscan.com/address/0xf5cb93f18ed8bf23b00b78f2d0693aa60ca27538)

Autofarm Proxy:
- [0x30689827579a4962f4ce9fff58279cc9477d42d9](https://bscscan.com/address/0x30689827579a4962f4ce9fff58279cc9477d42d9)

Pancakeswap Proxy:
- [0x4c07abea65923e7e1084595be38e0755c9b42251](https://bscscan.com/address/0x4c07abea65923e7e1084595be38e0755c9b42251)

## Configuration

API first argument is key for accessing proxies:
- Autofarm Proxy under `auto` key
- Pancakeswap Proxy under `cake` key

Autofarm CAKE Vault pid is 7 (full list available on Autofarm Vault contract)
Pancakeswap CAKE Pool pid is 0 (full list available on Pancakeswap Pool contract)

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

## Example implementation

With [Ethers.js](https://github.com/Mc01/bsc-api/tree/master/example#bsc-api)
