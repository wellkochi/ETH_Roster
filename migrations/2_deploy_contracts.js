var Roster = artifacts.require("./contracts/Warehouse.sol");

module.exports = function(deployer) {
  deployer.deploy(Roster);
};
