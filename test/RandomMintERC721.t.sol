// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {RandomMintERC721} from "../src/RandomMintERC721.sol";

contract CounterTest is Test {

    RandomMintERC721 public RandomMintERC721Contract;
    address user1;
    address user2;

    function setUp() public {
        RandomMintNFTContract = new RandomMintNFT();
        user1 = makeAddr("user1");
        user2 = makeAddr("user2");
    }

    function test_isBlind_tokenURI() public {
        vm.startPrank(user1);
        RandomMintERC721Contract.mint(user1);
        string memory isBlindTokenURI = RandomMintERC721Contract.tokenURI();
        assertEq(isBlindTokenURI, "ipfs://QmUtEJYJbZu7wmT34fKBPTSzYLfMxwjzvaRjJ5dLQRjBVR");
        vm.stopPrank();
    }

    function test_reveal_tokenURI() public {
        vm.startPrank(user2);
        RandomMintERC721Contract.setIsBlind(false);
        string memory revealTokenURI = RandomMintERC721Contract.tokenURI();
        assertEq(isBlindTokenURI, "ipfs://QmWw9UEQ4gBGjsjKBE1g1UhbupkJicK8QRxTvUzbTrp26F");
        vm.stopPrank();        
    }
}