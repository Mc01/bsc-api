# BSC API

- [Live example](https://mc01.github.io/bsc-api/)
- [Code sample](https://github.com/Mc01/bsc-api/blob/master/example/src/components/HelloWorld.vue)

## Ethers.js

Setup
```JS
const provider = new ethers.providers.JsonRpcProvider(
  'https://bsc-dataseed1.binance.org:443',
)
const bscApiAddress = '0xf5cb93f18ed8bf23b00b78f2d0693aa60ca27538'
const bscAbi = ['function get(string, uint, address) view returns (uint, uint, uint)']
const bscApi = new ethers.Contract(bscApiAddress, bscAbi, provider)
```

Arguments
```JS
const account = '0xF7DE62B65768a169279be74b12FaA65a22FB38D3'

const autoKey = 'auto'
const cakeV2Key = 'cake2'

const autoVaultPid = 7
const cakeFakePid = 0
```

Call Autofarm
```JS
bscApi.get(autoKey, autoVaultPid, account)
```

Call Pancakeswap V2
```JS
bscApi.get(cakeV2Key, cakeFakePid, account)
```
