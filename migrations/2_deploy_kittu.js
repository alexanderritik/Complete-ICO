const Kittutoken = artifacts.require("Kittutoken");
const Kittutokensale = artifacts.require("Kittutokensale");


module.exports = function (deployer) {
  deployer.deploy(Kittutoken, 100000).then(function(){
    return deployer.deploy(Kittutokensale , 1000000000000000 , Kittutoken.address);
  })
  
};
