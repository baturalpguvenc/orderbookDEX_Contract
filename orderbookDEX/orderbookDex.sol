// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrderbookDEX {
    address public owner;
    uint256 public tradingFee;

    struct Order {
        address trader;
        uint256 amount;
        uint256 price;
        bool isBuyOrder;
    }

    Order[] public orderbook;
    mapping(address => uint256) public balance;
    mapping(address => mapping(uint256 => bool)) public orderFulfilled;
    mapping(address => uint256[]) public tradeHistory;

    event Trade(address indexed buyer, address indexed seller, uint256 amount, uint256 price);

    constructor(uint256 _fee) {
        owner = msg.sender;
        tradingFee = _fee;
    }

    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balance[msg.sender] += msg.value;
    }

    function createLimitOrder(uint256 _amount, uint256 _price, bool _isBuyOrder) external {
        require(_amount > 0, "Amount must be greater than 0");
        require(_price > 0, "Price must be greater than 0");

        Order memory newOrder = Order(msg.sender, _amount, _price, _isBuyOrder);
        orderbook.push(newOrder);
    }

    function executeTrade(uint256 orderIndex, uint256 amount) external {
        require(orderIndex < orderbook.length, "Invalid order index");
        Order storage order = orderbook[orderIndex];

        if (order.isBuyOrder) {
            uint256 cost = amount * order.price;
            require(balance[msg.sender] >= cost, "Insufficient balance");
            require(order.amount >= amount, "Not enough tokens in the order");

            balance[msg.sender] -= cost;
            balance[order.trader] += cost - (cost * tradingFee / 100);
            order.amount -= amount;

            if (order.amount == 0) {
                orderbook[orderIndex] = orderbook[orderbook.length - 1];
                orderbook.pop();
            }

            tradeHistory[msg.sender].push(orderIndex);
            tradeHistory[order.trader].push(orderIndex);

            emit Trade(msg.sender, order.trader, amount, order.price);
        } else {
            require(balance[msg.sender] >= amount, "Insufficient balance");
            require(order.amount >= amount, "Not enough tokens in the order");

            balance[msg.sender] -= amount;
            balance[order.trader] += amount * order.price - (amount * order.price * tradingFee / 100);
            order.amount -= amount;

            if (order.amount == 0) {
                orderbook[orderIndex] = orderbook[orderbook.length - 1];
                orderbook.pop();
            }

            tradeHistory[msg.sender].push(orderIndex);
            tradeHistory[order.trader].push(orderIndex);

            emit Trade(msg.sender, order.trader, amount, order.price);
        }
    }
}
