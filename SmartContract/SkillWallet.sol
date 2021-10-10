// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract SkillWallet
{

    address ContractOwner;

    function skillWallet() public {
        ContractOwner = msg.sender;
    }

    struct UserInfo {
        string FullName;
        string EmailID;
        uint MobileNo;
    }
   
    struct UserSkill {
        string Skill_Duration;
        string Skill_Name;
        string Skill_AssignedDate;
        bytes Skill_Hash;
        string Skill_CertifiedFor;
    }

    struct SkillRequest {
        string RequestedBy;
        uint Skill_Duration;
        uint Skill_Name;
        uint Skill_AssignedDate;
        uint Skill_Hash;
        uint Skill_CertifiedFor;
        uint Skill_OverAll_Status;
    }

    /*
        ApprovalStatus
        --------------
        0 --  default status
        1 --  Requested
        2 --  Approved
        3 --  Rejected
    */

    mapping(address => UserInfo[]) UserMap;
    mapping(address => UserSkill[]) UserSkillMap;
    mapping(address => SkillRequest[]) SkillRequestMap;

    function AddUser(address UserAddress,string memory FullName,string memory EmailID,uint MobileNo) public
    {
        UserMap[UserAddress].push(UserInfo(FullName,EmailID,MobileNo));
    }

    function AddUserSkill(address UserAddress,string memory Skill_Duration, string memory Skill_Name, string memory Skill_AssignedDate, bytes memory Skill_Hash, string memory Skill_CertifiedFor) public
    {
        UserSkillMap[UserAddress].push(UserSkill(Skill_Duration, Skill_Name, Skill_AssignedDate, Skill_Hash, Skill_CertifiedFor));
    }

    function AddSkillRequest(address UserAddress,string memory RequestedBy, uint Skill_Duration, uint Skill_Name, uint Skill_AssignedDate, uint Skill_Hash, uint Skill_CertifiedFor, uint Skill_OverAll_Status) public
    {
        SkillRequestMap[UserAddress].push(SkillRequest(RequestedBy, Skill_Duration, Skill_Name, Skill_AssignedDate, Skill_Hash, Skill_CertifiedFor, Skill_OverAll_Status));
    }

    function ViewSkillRequestLength(address UserAddress) public view returns(uint)
    {
        return SkillRequestMap[UserAddress].length;
    }

    function ViewSkillRequestHeader(address UserAddress, uint RequestIndex) public view returns(string memory RequestedBy, uint Skill_OverAll_Status)
    {
        SkillRequest memory ThisSkillRequest=SkillRequestMap[UserAddress][RequestIndex];
        return (ThisSkillRequest.RequestedBy, ThisSkillRequest.Skill_OverAll_Status);
    }

    function ViewSkillRequestDetail(address UserAddress, uint RequestIndex) public view returns(string memory RequestedBy, uint Skill_Duration, uint Skill_Name, uint Skill_AssignedDate, uint Skill_Hash, uint Skill_CertifiedFor, uint Skill_OverAll_Status)
    {
        SkillRequest memory ThisSkillRequest=SkillRequestMap[UserAddress][RequestIndex];
        return (ThisSkillRequest.RequestedBy, ThisSkillRequest.Skill_Duration, ThisSkillRequest.Skill_Name, ThisSkillRequest.Skill_AssignedDate, ThisSkillRequest.Skill_Hash, ThisSkillRequest.Skill_CertifiedFor, ThisSkillRequest.Skill_OverAll_Status);
    }

    function UpdateRequestStatus(address UserAddress, uint RequestIndex, uint Skill_Duration, uint Skill_Name, uint Skill_AssignedDate, uint Skill_Hash, uint Skill_CertifiedFor, uint Skill_OverAll_Status) public
    {
        SkillRequestMap[UserAddress][RequestIndex].Skill_Duration=Skill_Duration;
        SkillRequestMap[UserAddress][RequestIndex].Skill_Name=Skill_Name;
        SkillRequestMap[UserAddress][RequestIndex].Skill_AssignedDate=Skill_AssignedDate;
        SkillRequestMap[UserAddress][RequestIndex].Skill_Hash=Skill_Hash;
        SkillRequestMap[UserAddress][RequestIndex].Skill_CertifiedFor=Skill_CertifiedFor;
        SkillRequestMap[UserAddress][RequestIndex].Skill_OverAll_Status=Skill_OverAll_Status;
    }

    function viewUser(address UserAddress, uint UserIndex) public view returns(string memory FullName,string memory EmailID,uint MobileNo)
    {
        UserInfo memory ThisUser=UserMap[UserAddress][UserIndex];
        return (ThisUser.FullName, ThisUser.EmailID, ThisUser.MobileNo);
    }

    function viewUserSkill(address UserAddress, uint RequestIndex) public view returns(uint Skill_Duration_S, string memory Skill_Duration_V, uint Skill_Name_S, string memory Skill_Name_V, uint Skill_AssignedDate_S, string memory Skill_AssignedDate_V, uint Skill_Hash_S, bytes memory Skill_Hash_V, uint Skill_CertifiedFor_S, string memory Skill_CertifiedFor_V)
    {
        UserSkill memory ThisUserSkill=UserSkillMap[UserAddress][0];
        SkillRequest memory ThisSkillRequest=SkillRequestMap[UserAddress][RequestIndex];
        return (ThisSkillRequest.Skill_Duration, ThisUserSkill.Skill_Duration, ThisSkillRequest.Skill_Name, ThisUserSkill.Skill_Name, ThisSkillRequest.Skill_AssignedDate, ThisUserSkill.Skill_AssignedDate, ThisSkillRequest.Skill_Hash, ThisUserSkill.Skill_Hash, ThisSkillRequest.Skill_CertifiedFor, ThisUserSkill.Skill_CertifiedFor);
    }

}