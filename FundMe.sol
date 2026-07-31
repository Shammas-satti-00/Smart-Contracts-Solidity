// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract FundMe
{   uint256 public minimumUSD;
    function fund() public payable {

        require(msg.value >= minimumUSD, "You need to spend more ETH!");
    }
    function getPrice public view returns  ()
    {   //0xE4aB69C077896252FAFBD49EFD26B5D171A32410
    AggregatorV3Interface pricefeed = AggregatorV3Interface(0xE4aB69C077896252FAFBD49EFD26B5D171A32410);
    (,int256 price,,,) = pricefeed.latestRoundData();
    minimumUSD = 50 * 10**18 / uint256(price);
    }
    }
    function getVersion public view  returns (uint256) {
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0xE4aB69C077896252FAFBD49EFD26B5D171A32410);
        return pricefeed.version();
    } 
    function getConversionRate public (){
        uint256 ethPrice =getPrice();
        uint256 ethAmountInUsd = (ethPrice *ethAmount) /1e18;
        return ethAmountInUsd;
     }
  //  function withdraw(){}    
}