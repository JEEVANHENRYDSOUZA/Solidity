// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

           contract LogicGates {
    function and(bool a, bool b) public pure returns (bool) {
        // Write your code herereturn
        return a && b;
    }

    function or(bool a, bool b) public pure returns (bool) {
        // Write your code here
        
        return a||b;
    }
    function not(bool a) public pure returns (bool) {
        // Write your code here
        return (!a);
    }

    function xor(bool a, bool b) public pure returns (bool) {
        // Write your code here

        return (a && !b)||(!a && b);
    }
}
