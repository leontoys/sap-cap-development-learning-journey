namespace employee.service.db;

entity Employee {
    key employeeID : UUID;
    firstName : String;
    lastName : String;
    address : String;
    mobile : String;
    salary : Decimal(10,2); 
    email : String;
    designation : String;
}



