// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SchoolManagement {
    address public owner;

    enum Role { None, Student, Staff }

    struct Student {
        string name;
        Role role;
        uint256 balance;
    }

    mapping(address => Student) public students;
    mapping(address => uint256) public feesPaid;
    
    event StudentRegistered(address indexed user, string name, Role role);
    event FeePaid(address indexed student, uint256 amount);
    event Withdrawn(address indexed staff, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    modifier onlyStaff() {
        require(students[msg.sender].role == Role.Staff, "Not a staff member");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerStudent(address _user, string memory _name, Role _role) public onlyOwner {
        require(students[_user].role == Role.None, "Student already registered");
        students[_user] = Student(_name, _role, 0);
        emit StudentRegistered(_user, _name, _role);
    }

    function payFees() public payable {
        require(students[msg.sender].role == Role.Student, "Only students can pay fees");
        require(msg.value > 0, "Must send Ether to pay fees");
        feesPaid[msg.sender] += msg.value;
        emit FeePaid(msg.sender, msg.value);
    }

    function withdrawFunds(uint256 amount) public onlyStaff {
        require(amount > 0, "Amount must be greater than zero");
        require(address(this).balance >= amount, "Insufficient balance");
        payable(msg.sender).transfer(amount);
        emit Withdrawn(msg.sender, amount);
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}