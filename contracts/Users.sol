pragma solidity >=0.4.17;
pragma experimental ABIEncoderV2;


contract allUsers{
    struct response{
        uint status;
        string message;
    }
    
    function getEncryptedPassword(string memory password) public pure returns(uint){
        return uint(keccak256(abi.encodePacked(password)));
    }
}

contract User is allUsers{
    allUsers _allUsers;

    struct user{
        string name;
        string userName;
        string userType;
        address blockAddress;
        uint password;
        string mobile;
        bool flag;
    }

    mapping (string => user) registeredUsers;

    function checkUserExists(string memory mobile) public view returns(bool){
        if(registeredUsers[mobile].flag == true) return true;
        return false;
    }

    function registerUser(string memory name,string memory _uName,string memory _uType,string memory password,string memory mobile,address _address) public returns (response memory){
        if(!checkUserExists(mobile)){
            string memory localName = name;
            string memory localUserName = _uName;
            string memory localUserType = _uType;
            uint localPassword = _allUsers.getEncryptedPassword(password);
            string memory localMobile = mobile;
            address userAddress = _address;
            user memory _user = user(localName,localUserName,localUserType,userAddress,localPassword,localMobile,true);
            registeredUsers[mobile] = _user;
            return response(200,"User registered successfully!");
        }
        else{
            return response(409,"User already exists in the database");
        }
    }

    function login(string memory mobile, string memory _password) public view returns(response memory){
        if(checkUserExists(mobile)){
            if(registeredUsers[mobile].password == _allUsers.getEncryptedPassword(_password)){
                return response(200,"Login successful");
            }
            else{
                return response(401,"Invalid credentials");
            }
        }
        else{
            return response(401,"Invalid credentials");
        }
    }

    function getLoggedIn_User(string memory mobile) public view returns(user memory){
        if(checkUserExists(mobile)){
            return registeredUsers[mobile];
        }
        else{
            revert("Invalid User!");
        }
    }

    function setNewPassword(string memory mobile,string memory _password) public returns (response memory){
        if(checkUserExists(mobile)){
            registeredUsers[mobile].password = _allUsers.getEncryptedPassword(_password);
            return response(200,"Password changed successfully");
        }
        else{
            return response(409,"User does not exist.");
        }
    }
}

contract Doctor is allUsers{
    allUsers _allUsers;

    struct doctor{
        string name;
        string userName;
        string doctorId;
        string speciality;
        string university;
        string userType;
        address blockAddress;
        uint password;
        string mobile;
        bool flag;
    }

     mapping (string => doctor) registeredDoctors;

    function checkDoctorExists(string memory mobile) public view returns(bool){
        if(registeredDoctors[mobile].flag == true) return true;
        return false;
    }

    function registerDoctor(string memory name,string memory _uName,string memory _uType,string memory password,string memory mobile,address _address,string memory _doctorId,string memory _speciality,string memory _university) public returns(response memory){
        if(!checkDoctorExists(mobile)){
            string memory localName = name;
            string memory localUserName = _uName;
            string memory localUserType = _uType;
            uint localPassword = _allUsers.getEncryptedPassword(password);
            string memory localMobile = mobile;
            address userAddress = _address;
            string memory doctorId = _doctorId;
            string memory speciality = _speciality;
            string memory university = _university;
            doctor memory _doctor = doctor(localName,localUserName,doctorId,speciality,university,localUserType,userAddress,localPassword,localMobile,true);
            registeredDoctors[mobile] = _doctor;
            return response(200,"User registered successfully!");
        }
        else{
            return response(409,"User already exists in the database");
        }
    }

    function login(string memory mobile, string memory _password) public view returns(response memory){
        if(checkDoctorExists(mobile)){
            if(registeredDoctors[mobile].password == _allUsers.getEncryptedPassword(_password)){
                return response(200,"Login successful");
            }
            else{
                return response(401,"Invalid credentials");
            }
        }
        else{
            return response(401,"Invalid credentials");
        }
    }

    function getLoggedIn_Doctor(string memory mobile) public view returns(doctor memory){
        if(checkDoctorExists(mobile)){
            return registeredDoctors[mobile];
        }
        else{
            revert("Invalid User!");
        }
    }

    function setNewPassword(string memory mobile,string memory _password) public returns(response memory){
        if(checkDoctorExists(mobile)){
            registeredDoctors[mobile].password = _allUsers.getEncryptedPassword(_password);
            return response(200,"Password changed successfully");
        }
        else{
            return response(409,"User does not exist.");
        }
    }
}

contract Police is allUsers{
    allUsers _allUsers;

    struct police{
        string name;
        string userName;
        string userType;
        address blockAddress;
        uint password;
        string mobile;
        bool flag;
    }

     mapping (string => police) registeredPolice;

    function checkPoliceExists(string memory mobile) public view returns(bool){
        if(registeredPolice[mobile].flag == true) return true;
        return false;
    }

    function registerPolice(string memory name,string memory _uName,string memory _uType,string memory password,string memory mobile,address _address) public returns (response memory){
        if(!checkPoliceExists(mobile)){
            string memory localName = name;
            string memory localUserName = _uName;
            string memory localUserType = _uType;
            uint localPassword = _allUsers.getEncryptedPassword(password);
            string memory localMobile = mobile;
            address userAddress = _address;
            police memory _police = police(localName,localUserName,localUserType,userAddress,localPassword,localMobile,true);
            registeredPolice[mobile] = _police;
            return response(200,"User registered successfully!");
        }
        else{
            return response(409,"User already exists in the database");
        }
    }

    function login(string memory mobile, string memory _password) public view returns(response memory){
        if(checkPoliceExists(mobile)){
            if(registeredPolice[mobile].password == _allUsers.getEncryptedPassword(_password)){
                return response(200,"Login successful");
            }
            else{
                return response(401,"Invalid credentials");
            }
        }
        else{
            return response(401,"Invalid credentials");
        }
    }

    function getLoggedIn_Police(string memory mobile) public view returns(police memory){
        if(checkPoliceExists(mobile)){
            return registeredPolice[mobile];
        }
        else{
            revert("Invalid User!");
        }
    }

    function setNewPassword(string memory mobile,string memory _password) public returns (response memory){
        if(checkPoliceExists(mobile)){
            registeredPolice[mobile].password = _allUsers.getEncryptedPassword(_password);
            return response(200,"Password changed successfully");
        }
        else{
            return response(409,"Police does not exist.");
        }
    }
}

contract Insurer is allUsers{
    allUsers _allUsers;

    struct insurer{
        string name;
        string userName;
        string userType;
        address blockAddress;
        uint password;
        string mobile;
        bool flag;
    }

     mapping (string => insurer) registeredInsurer;

    function checkInsurerExists(string memory mobile) public view returns(bool){
        if(registeredInsurer[mobile].flag == true) return true;
        return false;
    }

    function registerInsurer(string memory name,string memory _uName,string memory _uType,string memory password,string memory mobile,address _address) public returns (response memory){
        if(!checkInsurerExists(mobile)){
            string memory localName = name;
            string memory localUserName = _uName;
            string memory localUserType = _uType;
            uint localPassword = _allUsers.getEncryptedPassword(password);
            string memory localMobile = mobile;
            address userAddress = _address;
            insurer memory _insurer = insurer(localName,localUserName,localUserType,userAddress,localPassword,localMobile,true);
            registeredInsurer[mobile] = _insurer;
            return response(200,"User registered successfully!");
        }
        else{
            return response(409,"User already exists in the database");
        }
    }

    function login(string memory mobile, string memory _password) public view returns(response memory){
        if(checkInsurerExists(mobile)){
            if(registeredInsurer[mobile].password == _allUsers.getEncryptedPassword(_password)){
                return response(200,"Login successful");
            }
            else{
                return response(401,"Invalid credentials");
            }
        }
        else{
            return response(401,"Invalid credentials");
        }
    }

    function getLoggedIn_Insurer(string memory mobile) public view returns(insurer memory){
        if(checkInsurerExists(mobile)){
            return registeredInsurer[mobile];
        }
        else{
            revert("Invalid User!");
        }
    }

    function setNewPassword(string memory mobile,string memory _password) public returns (response memory){
        if(checkInsurerExists(mobile)){
            registeredInsurer[mobile].password = _allUsers.getEncryptedPassword(_password);
            return response(200,"Password changed successfully");
        }
        else{
            return response(409,"Insurer does not exist.");
        }
    }
}