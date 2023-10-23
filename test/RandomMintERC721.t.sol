// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {MintERC721} from "../src/RandomMintERC721.sol";

contract CounterTest is Test {

    MintERC721 public RandomMintERC721Contract;
    address user1;
    address user2;

    function setUp() public {
        RandomMintERC721Contract = new MintERC721();
        user1 = makeAddr("user1");
        user2 = makeAddr("user2");
    }

    function test_isBlind_tokenURI() public {
        vm.startPrank(user1);
        RandomMintERC721Contract.mint(user1);
        assertEq(RandomMintERC721Contract.tokenURI(1), "ipfs://QmUtEJYJbZu7wmT34fKBPTSzYLfMxwjzvaRjJ5dLQRjBVR");
        vm.stopPrank();
    }

    function test_reveal_tokenURI() public {
        vm.startPrank(user2);
        RandomMintERC721Contract.setIsBlind(false);
        vm.stopPrank;

        vm.startPrank(user1);
        RandomMintERC721Contract.mint(user1);
        assertEq(RandomMintERC721Contract.tokenURI(1), "ipfs://QmWw9UEQ4gBGjsjKBE1g1UhbupkJicK8QRxTvUzbTrp26F");
        vm.stopPrank();        
    }
}