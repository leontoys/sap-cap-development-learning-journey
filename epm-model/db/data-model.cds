namespace epm.db;//to uniquely identify the project

using { cuid } from '@sap/cds/common';


context master { //for grouping

    entity employees : cuid {
        //key empId : String(32);
        nameFirst : String(40);
        nameMiddle : String(40);
        nameLast : String(40);
        nameInitials : String(40);
        sex : String(1);
        language : String(1);
        phoneNumber : String(20);
        email : String(30);
        Currency : String(4);
        salaryAmount : Decimal(10, 2);
        accountNumber : String(16);
        bankId : String(8);
        bankName : String(64);
    }
    
}
