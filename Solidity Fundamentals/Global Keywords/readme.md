Global Keywords in Solidity 
1.block <br/>
2.msg  <br/>
    - Properties of msg are <br/>
    1. msg.value: is a global variable in Solidity that represents the amount of Ether (the cryptocurrency used on the Ethereum network)  <br/>
    that was sent with a transaction to a payable function in a smart contract. <br/> <br/>
    2.msg.sender: msg.sender is a global variable in Solidity that represents the address of the account that initiated the current transaction. <br/>
    It is always set to the address that sent the transaction, whether it is an externally owned account (EOA) or a smart contract. <br/>
    
3. this <br/>
    - Properties of this are
    1. this is not a function in Solidity, it is a keyword that refers to the current instance of the contract. <br/>
    2. It does not return any value, but can be used in various ways to interact with the current contract instance.<br/>
4. tx <br/>
   - tx is a global variable in Solidity that provides information about the current transaction. It contains several properties that can be accessed within a contract function.
   - Some of the properties available in tx include:
1. tx.origin: the address that originated the transaction (i.e., the original sender)<br/>
2. tx.gasprice: the gas price (in wei) that the transaction sender is willing to pay<br/>
3. tx.origin: the address that originated the transaction (i.e., the original sender<br/>
4. tx.gaslimit: the maximum amount of gas that can be used for the transaction<br/>
5. tx.value: the amount of Ether (in wei) sent with the transaction<br/>
