// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract WhiteListSaleB is Ownable {
    struct WhiteList {
        uint256 qty;
        bool isMinter;
    }
    uint256 public constant PRE_MAX_QTY_PER_MINTER = 3;

    bool public isWhiteListActive = false;

    mapping(address => WhiteList) public whiteList;

    event WhiteListSetup(address[] addresses);
    event WhiteListDeleted(address[] addresses);

    constructor() {}

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
        return whiteList[_address].isMinter;
    }

    // Action
    function setWhitListActive(bool _isAllowListActive) external onlyOwner {
        isWhiteListActive = _isAllowListActive;
    }

    function setWhiteList(address[] calldata addresses)
        external
        onlyOwner
        nonWhiteListSaleActivity
    {
        for (uint256 i = 0; i < addresses.length; i++) {
            whiteList[addresses[i]].qty = PRE_MAX_QTY_PER_MINTER;
            whiteList[addresses[i]].isMinter = true;
        }
        emit WhiteListSetup(addresses);
    }

    function deleteWhiteList(address[] calldata addresses) external onlyOwner {
        for (uint256 i = 0; i < addresses.length; i++) {
            delete whiteList[addresses[i]];
        }
        emit WhiteListDeleted(addresses);
    }
}
