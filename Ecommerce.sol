// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.21;

contract Ecommerce{


    int public revenue;
    string public ownerName;
    address public owner;

    struct product {
        uint productNo;
        string prodName;
        int noItem;
        int unitCost;
    }

    product[] public productList;
    int public totalProducts;

    constructor() {
        ownerName="Shahid";
        revenue=0;
        owner=msg.sender;
    }

    function addProduct(uint id, string memory name, int num, int cost) public {
        product memory newProduct;
        newProduct = product(id, name, num, cost);
        productList.push(newProduct);
        totalProducts=totalProducts+1;
    }

  

    function purchaseItem(uint id, int quant) public payable returns (bool, bytes memory) {
        int cost;
        bool success;
        bytes memory data;
        cost=productList[id].unitCost*quant;
        require(productList[id].noItem>=quant, "out of stock");
        require(msg.value>=uint(cost), "out of balance");
        (success, data) = owner.call{value: uint(cost)}("");
        productList[id].noItem=productList[id].noItem-quant;
        revenue=revenue+cost;
        return (success, data);
    }

      function returnItem(uint id, int quant, address custAddress) public payable returns (bool, bytes memory) {
        int cost;
        bool success;
        bytes memory data;
        cost=productList[id].unitCost*quant;
        require(msg.sender==owner, "you are not authorized");
        (success, data) = custAddress.call{value: uint(cost)}("");
        productList[id].noItem=productList[id].noItem+quant;
        revenue=revenue-cost;
        return (success, data);
    }

    function changePrice(uint id, int price) public {
        productList[id].unitCost=productList[id].unitCost+price;
    }

    function addItem(uint id, int quant) public {
        productList[id].noItem=productList[id].noItem+quant;
    }

    function getBalance() public view returns (int) {
        return (int) (owner.balance);
    }
}
