// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract WhiteListSale is Ownable {
    uint256 public constant PRE_MAX_QTY_PER_MINTER = 3; // 3

    bool public isWhiteListActive = false;
    
    mapping(address => uint256) public whiteList;
    mapping(address => bool) public whiteListBool;

    event WhiteListSetup(address[] addresses);
    event WhiteListDeleted(address[] addresses);

    constructor() {

    }

    modifier isWhiteListSaleActivity() {
        require(isWhiteListActive, "White list sale is not active.");
        _;
    }

    modifier nonWhiteListSaleActivity() {
        require(!isWhiteListActive, "White list sale is active,can't do it.");
        _;
    }
    // View
    function isWhiteListMinter(address _address) public view returns (bool) {
        return whiteListBool[_address];
    }
    // Action
    function setWhitListActive(bool _isAllowListActive) external onlyOwner {
        isWhiteListActive = _isAllowListActive;
    }

    function setWhiteList(address[] calldata addresses) external onlyOwner nonWhiteListSaleActivity {
        for (uint256 i = 0; i < addresses.length; i++) {
            whiteList[addresses[i]] = PRE_MAX_QTY_PER_MINTER;
            whiteListBool[addresses[i]] = true;
        }
        emit WhiteListSetup(addresses);
    }

    function deleteWhiteList(address[] calldata addresses) external onlyOwner {
        for (uint256 i = 0; i < addresses.length; i++) {
            delete whiteList[addresses[i]];
            whiteListBool[addresses[i]] = false;
        }
        emit WhiteListDeleted(addresses);
    }
}