<template>
  <p>
    <b>Auto</b>&nbsp;
    <span>Balance: {{ state.auto.balance }} AUTO</span>&nbsp;
    <span>Staked: {{ state.auto.staked }} CAKE</span>&nbsp;
    <span>Pending: {{ state.auto.pending }} AUTO</span>
  </p>
  <p>
    <b>Cake</b>&nbsp;
    <span>Balance: {{ state.cake.balance }} CAKE</span>&nbsp;
    <span>Staked: {{ state.cake.staked }} CAKE</span>&nbsp;
    <span>Pending: {{ state.cake.pending }} CAKE</span>
  </p>
</template>

<script setup>
import { reactive } from 'vue'
import { ethers } from 'ethers'

const account = '0xF7DE62B65768a169279be74b12FaA65a22FB38D3'

const provider = new ethers.providers.JsonRpcProvider(
  'https://bsc-dataseed1.binance.org:443',
)
const bscApiAddress = '0xf5cb93f18ed8bf23b00b78f2d0693aa60ca27538'
const bscAbi = ['function get(string, uint, address) view returns (uint, uint, uint)']
const bscApi = new ethers.Contract(bscApiAddress, bscAbi, provider)

const autoKey = 'auto'
const cakeKey = 'cake'

const autoVaultPid = 7
const cakePoolPid = 0

const state = reactive({
  auto: {},
  cake: {}
})

bscApi.get(autoKey, autoVaultPid, account).then(
  (result) => {
    state.auto.balance = ethers.utils.formatEther(result[0])
    state.auto.staked = ethers.utils.formatEther(result[1])
    state.auto.pending = ethers.utils.formatEther(result[2])
  }
)

bscApi.get(cakeKey, cakePoolPid, account).then(
  (result) => {
    state.cake.balance = ethers.utils.formatEther(result[0])
    state.cake.staked = ethers.utils.formatEther(result[1])
    state.cake.pending = ethers.utils.formatEther(result[2])
  }
)
</script>

<style scoped></style>
