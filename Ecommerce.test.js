const assert = require("assert");
const ganache = require("ganache-cli");
const Web3 = require("web3");
const web3 = new Web3(ganache.provider());
const {abi , bytecode} = require('../compile');

class myTest {

    constructor() {
        this.prodNames=["tv" , "laptop" , "notebook" , "phone"];
        this.prices=[400 , 500 , 200 , 700];
        this.quantities=[5 , 10 , 15 , 20];
    }

    changeProductName(id , newstring) {
        prodName[id] = newstring;
    }

    changePrice(id , newPrice) {
        prices[id] = newPrice;
    }

}



describe("Car", () => {
let accounts;
let ecommerce;
beforeEach(async () => {
    accounts = await web3.eth.getAccounts();
    ecommerce = await new web3.eth.Contract(abi)
    .deploy({
    data: bytecode,
    arguments: ["Ben"],
    })
    .send({ from: accounts[0], gasPrice: 8000000000, gas: 4700000});
    });
    ecommerce.test.js


    it("changing product", async () => {
        console.log(accounts);
        assert.ok(ecommerce.options.address);
    });

});