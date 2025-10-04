namespace employee.service.db;

using { cuid, managed } from '@sap/cds/common';


type CommonFields {
    firstName : String;
    lastName : String;
    address : String;
    mobile : String;
}

entity Employee : CommonFields, cuid, managed { 
    salary : Decimal(10,2); 
    email : String;
    designation : Association to Designations;
    //familyMembers : Association to many FamilyMember on familyMembers.employee  = $self
    familyMembers : Composition of many FamilyMember on familyMembers.employee = $self
}

entity FamilyMember : CommonFields, cuid,managed {
    relationship : String;
    employee : Association to Employee;
}

entity Designations  {
    key code : String;
    name : String;
}


