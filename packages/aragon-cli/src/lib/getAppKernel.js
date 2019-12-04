const aragonAppAbi = require('@aragon/os/build/contracts/AragonApp').abi
const { ZERO_ADDRESS } = require('../util')

/**
 * Return kernel address for an Aragon app
 *
 * @param {Object} web3 web3
 * @param {string} appAddress App address
 * @returns {Promise<string>} Kernel address
 */
module.exports = async (web3, appAddress) => {
  const app = new web3.eth.Contract(aragonAppAbi, appAddress)
  const kernel = await app.methods.kernel().call()

  if (kernel === ZERO_ADDRESS)
    throw new Error(`No kernel found for ${appAddress}`)

  return kernel
}