# WhiteList extension 白名單擴充

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
import "./WhiteListSale.sol";
// or
import "./WhiteListSaleB.sol";

contract LionHeart is 
    WhiteListSale,
    // or 
    WhiteListSaleB
{
    function preMint(uint256 _mintQty) external payable
        isWhiteListSaleActivity
    {
        // ...
    }
}
```

### Step

1. setWhiteList(["0x"]) or deleteWhiteList([0x])
2. setWhitListActive(true)
