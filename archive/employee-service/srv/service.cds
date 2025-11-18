using { employee.service.db as employeedb } from '../db/datamodel';

using { Northwind as external } from './external/Northwind.csn';


 
service EmployeeOdataService {
    @odata.draft.enabled
    entity Employee as projection on employeedb.Employee;
    //entity FamilyMember as projection on employeedb.FamilyMember;
    entity Designations as projection on employeedb.Designations;

    annotate Employee with @(restrict:[
        {grant:['READ','WRITE','UPDATE'],to:['employee']},
        {grant:['READ'],to:['manager']}
    ]);
    

    entity Products as projection on external.Products;

}