const Kittutoken = artifacts.require("Kittutoken");

module.exports = function (deployer) {
  deployer.deploy(Kittutoken);
};
