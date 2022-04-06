# Reveal 開盲盒 extension

## RevalA

* 設定盲盒、元數據、元數據副檔名
* 開啟盲盒（開啟後無法再轉為盲盒）
* Set blind box, metadata, metadata extension
* Open the blind box (can no longer be turned into a blind box after opening)

## RevalB

* 設定盲盒、元數據、元數據副檔名
* 開啟盲盒（開啟後無法再轉為盲盒）
* 元數據凍結（開啟後無法在設定元數據）
* Set blind box, metadata, metadata extension
* Open the blind box (can no longer be turned into a blind box after opening)
* Metadata freeze (can't set metadata after opening)

### Use at Main.sol

``` solidity
import "./RevealA.sol";

contract LionHeart is RevealA {
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return getTokenURI(tokenId, _baseURI());
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }
}
```

### Step

1. setNotRevealedURI / setBaseExtension
2. setBaseURI
3. reveal
