// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    address[] wavers;

    constructor() {
        console.log("Birb");
    }

    function wave() public {
        address sender = msg.sender;

        bool senderAllreadyWaved = false;
        for (uint256 i; i < wavers.length; i++) {
            if (sender == wavers[i]){
                senderAllreadyWaved = true;
            }
        }

        if(senderAllreadyWaved){
            console.log("Allready waved");
        } else {
            wavers.push(sender);
            totalWaves += 1;
            console.log("New addy waved");
        }
        
        console.log("%s has waved!", sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getTotalWavers() public view returns (uint256) {
        uint256 result = 0;
        if (wavers.length > 0 ){
            result = wavers.length;
        }
        console.log("We have %d total wavers!", result);
        return result;
    }
}
