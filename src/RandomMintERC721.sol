// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract MintERC721 is ERC721 {

    constructor() ERC721("Random mint ERC721 Token", "RMT") {}
    
    uint256 totalSupplyTokens = 500;
    bool isBlind = true;
    mapping (address => uint256[]) ownedTokenID;

    function mint(address _to) external {
        require(totalSupplyTokens>=1,"no more RMT now");
        totalSupplyTokens--;
        _mint(_to, 500 - totalSupplyTokens);
        ownedTokenID[_to].push(500 - totalSupplyTokens);
    }

    function getOwnedToken(address owner) external view returns (uint256[] memory){
        return ownedTokenID[owner];
    }

    function totalSupply() external view returns (uint256) {
        return 500 - totalSupplyTokens;
    }

    function setIsBlind(bool _isBlind) public{
        isBlind = _isBlind;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireOwned(tokenId);

        if(isBlind) return "ipfs://QmUtEJYJbZu7wmT34fKBPTSzYLfMxwjzvaRjJ5dLQRjBVR";
        else return "ipfs://QmWw9UEQ4gBGjsjKBE1g1UhbupkJicK8QRxTvUzbTrp26F";
    }
}

