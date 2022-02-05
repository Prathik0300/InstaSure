pragma solidity >=0.4.17;
pragma experimental ABIEncoderV2;

contract Address{
    struct userBlock{
        bytes32 name;
        bytes32 userName;
        bytes32 userType;
        address blockAddress;
        bytes32 password;
        bytes32 mobile;
        bool flag;
    }

    mapping (address => userBlock) public userDb;

    constructor() public{
        
    }

    function checkUserExists(address blockAddress) private view returns(bool){
        if(userDb[blockAddress].flag == true) return true;
        return false;
    }

    function getEncryptedPassword(bytes32 password) private pure returns (bytes32 result){
        return sha256(abi.encodePacked(password));
    }

    function setUser(bytes32 name, bytes32 userName,bytes32 userType, bytes32 password,bytes32 mobile) private{
        address userAddress = address(this);
        if(!checkUserExists(userAddress)){
            bytes32 localName = name;
            bytes32 localUserName = userName;
            bytes32 localUserType = userType;
            bytes32 localPassword = getEncryptedPassword(password);
            bytes32 localMobile = mobile;
            userBlock memory user = userBlock(localName,localUserName,localUserType,userAddress,localPassword,localMobile,true);
            userDb[userAddress] = user;
        }
    }
}