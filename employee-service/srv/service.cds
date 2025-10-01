using { employee.service.db as employeedb } from '../db/datamodel';

 
service EmployeeOdataService {

    entity Employee as projection on employeedb.Employee;
    //entity FamilyMember as projection on employeedb.FamilyMember;

}