// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/ERC20.sol)
pragma solidity ^0.8.5;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract Aetheryte is ERC20 {
    address public admin;
    constructor() ERC20('Aetheryte', 'RAWA'){
        _mint(msg.sender ,10000000 * 10 ** 18 );
        admin = msg.sender;
}

function mint(address to, uint amount)external {
    require(msg.sender == admin, 'only admin');
    _mint(to, amount);
}

function burn(uint amount)external{
    _burn(msg.sender, amount);
}
}