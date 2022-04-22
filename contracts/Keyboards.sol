// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

contract Keyboards {
    // creating enum to store type of keyboard and it's different attributes

    enum KeyboardKind {
        SixtyPercent,
        SeventyFivePercent,
        EightyPercent,
        Iso105
    }

    struct Keyboard {
        KeyboardKind kind;
        // ABS = false, PBT = true
        bool isPBT;
        // tailwind filters to layer over
        string filter;
        // user who created it!
        address owner;
    }

    event KeyboardCreated(Keyboard keyboard);

    event TipSent(address recipient, uint256 amount);

    // string[] public createdKeyboards; // this was for single string, but we will create an array to store multiple keyboards
    Keyboard[] public createdKeyboards;

    // a function which will return all the created keyboards array.
    function getKeyboards() public view returns (Keyboard[] memory) {
        return createdKeyboards;
    }

    // a function to create a keyboard
    function create(
        KeyboardKind _kind,
        bool _isPBT,
        string calldata _filter
    ) external {
        Keyboard memory newKeyboard = Keyboard({
            kind: _kind,
            isPBT: _isPBT,
            filter: _filter,
            owner: msg.sender
        });

        createdKeyboards.push(newKeyboard);
        emit KeyboardCreated(newKeyboard);
    }

    // function to tip a perticular keyboard
    function tip(uint256 _index) external payable {
        address payable owner = payable(createdKeyboards[_index].owner);
        owner.transfer(msg.value);
        emit TipSent(owner, msg.value);
    }
}

// 97704492cf1782ea10d482c3916b996674f7016a7d914de6daa9a09a2662a45d
// https://eth-rinkeby.alchemyapi.io/v2/xRV8KavFTBAX-LdnhgMUPRwzqqrz5lzj
