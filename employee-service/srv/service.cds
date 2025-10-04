using { employee.service.db as employeedb } from '../db/datamodel';

 
service EmployeeOdataService {
    @odata.draft.enabled
    entity Employee as projection on employeedb.Employee;
    //entity FamilyMember as projection on employeedb.FamilyMember;
    entity Designations as projection on employeedb.Designations;

}