pragma solidity ^0.8.9;

contract demoContract {
    // Fixed sized types (fixed sizes in memory)
    bool isReady; //true or false
    
    uint a; // unsigned integer, can only hold positive numbers, no float
    address recipient; //can hold address in the blockchain
    
    bytes32 data; //Great to use for strings that will limit to 32 bytes
    //Each bytes32 can store up to 32 letters (ASCII): each character is a byte.
    //Can use bytes1 to 32 to hold fixed data
    
    //bytes32 uses less gas because it fits in a single word of the EVM, 
    //and string is a dynamically sized-type which has current limitations 
    //in Solidity (such as can't be returned from a function to a contract).
    
    // Variable sized types (variable sizes in memory)
    string name;
    bytes dataGeneral; //Any binary data, no need to pre-define length
    uint[] arraysOfInt; //Array, must be of same types
    
    mapping(uint => string) users; //mapping is like JS objects - here you can
    //access any user by a unsigned integer and get back a string
    //users[10] = 'some string';
    
    // User defined data
    struct User {
        uint id;
        string name;
        uint[] friendIds; // , seperated
    }
    //after init a user, you need to place the struct into a container like mapping
    
    enum Color {
        RED, 
        GREEN,
        BLUE
    } //can use it like a label
    
    //call like a js object
    //Color.RED or Color.BLUE etc.
    
    //Enums restrict a variable to have one of only a few predefined values. The values in this enumerated list are called enums.
    //With the use of enums it is possible to reduce the number of bugs in your code.
    //For example, if we consider an application for a fresh juice shop, it would be possible to restrict the glass size to small, medium, and large.
    //This would make sure that it would not allow anyone to order any size other than small, medium, or large.
}
