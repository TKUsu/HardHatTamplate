// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract RevealA is Ownable {
    using Strings for uint256;

    bool public revealed = false;

    string public baseURI;
    string public notRevealedUri;
    string public baseExtension = ".json";

    event Reveal();

    constructor() {

    }

    // Action
    function reveal() public onlyOwner {
        revealed = true;
        emit Reveal();
    }
    // Set
    function setBaseURI(string calldata _tokenBaseURI) external onlyOwner {
        baseURI = _tokenBaseURI;
    }

    function setBaseExtension(string memory _newBaseExtension) public onlyOwner {
        baseExtension = _newBaseExtension;
    }

    function setNotRevealedURI(string memory _notRevealedURI) public onlyOwner {
        notRevealedUri = _notRevealedURI;
    }
    // View
    function getTokenURI(uint256 _tokenId, string memory _baseURI) internal view returns (string memory) {
        if (!revealed) {
            return notRevealedUri;
        }

        return
            bytes(_baseURI).length > 0
                ? string(
                    abi.encodePacked(
                        _baseURI,
                        _tokenId.toString(),
                        baseExtension
                    )
                )
                : "";
    }
}