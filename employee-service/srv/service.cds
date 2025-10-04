using { employee.service.db as employeedb } from '../db/datamodel';

using { Northwind as external } from './external/Northwind.csn';


 
service EmployeeOdataService {
    @odata.draft.enabled
    entity Employee as projection on employeedb.Employee;
    //entity FamilyMember as projection on employeedb.FamilyMember;
    entity Designations as projection on employeedb.Designations;

    entity Products as projection on external.Products;

}