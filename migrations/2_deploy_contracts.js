var Sieve = artifacts.require("Sieve");

module.exports = function(deployer) {
  deployer.deploy(Sieve);
};