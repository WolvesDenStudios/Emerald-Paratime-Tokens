// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.8;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol';

contract NeophyteCratesTest is ERC721, Ownable {
    uint256 public mintPrice = 0.05 ether;
    uint256 public totalSupply = 10000;
    uint256 public maxSupply = 10000;
    bool public isMintEnabled;
    mapping(address => uint256) public mintedWallets;

    constructor() payable ERC721('Simple Mint', 'NeophyteCratesTest'){
        maxSupply = 10000;
    }
    function toggleIsMintEnabled() external onlyOwner {
        isMintEnabled = !isMintEnabled;
    }

    function setMaxSupply(uint256 maxSupply_) external onlyOwner{
        maxSupply = maxSupply_;
    }
    function mint() external payable{
        require(isMintEnabled, 'Minting not enabled');
        require(mintedWallets[msg.sender] <1, 'exceeds max per wallet');
        require(msg.value == mintPrice, 'wrong value');
        require(maxSupply > totalSupply, 'sold out');

        mintedWallets[msg.sender]++;
        totalSupply++;
        uint256 tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);


    }
}
