//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// import "./ERC721.sol";
// import "./Ownable.sol";
// import "./Counters.sol";
// import "./ERC721Enumerable.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";


contract YOURNFTNAMEDEFAULT is ERC721, Ownable, ERC721Enumerable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    // Base URI
    string private _baseURIextended;
 
    
    // Max NFTs total. Due to burning this won't be the max tokenId
    uint internal MAX_SUPPLY = 10000;
    
    // Allow for starting/pausing sale
    bool public hasSaleStarted = false;

    uint256 public cost = 10000000000000000000; // 10 ether;

    constructor () ERC721("YOURNYOURNFTNAMEFTNAME", "ShortNftName") {}
    function setBaseURI(string memory baseURI_) external onlyOwner() {
        _baseURIextended = baseURI_;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseURIextended;
    }

    //only owner
    function setCost(uint256 _newCost) public onlyOwner {
      cost = _newCost;
    }

    function mint(address to) public onlyOwner {
        require(hasSaleStarted == true, "Sale hasn't started");
        require(totalSupply() < MAX_SUPPLY, "Max supply reached.");
        require(msg.value >= cost," The sent value is below the price" );
        _safeMint(to, _tokenIdCounter.current());
        _tokenIdCounter.increment();
    }

    //only owner
    function setStartSale() public onlyOwner {
      hasSaleStarted = true;
    }

    //only owner
    function setPauseSale() public onlyOwner {
      hasSaleStarted = false;
    }

    //only owner
    function withdrawAll() public payable onlyOwner {
      require(payable(msg.sender).send(address(this).balance));
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
