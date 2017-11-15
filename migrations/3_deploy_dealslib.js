var tsc_token = artifacts.require("./TSCToken.sol");
var deals = artifacts.require("./Deals.sol");
var dealslib = artifacts.require("./DealsLib.sol");

module.exports = function(deployer) {
  deployer.deploy(dealslib);
};
