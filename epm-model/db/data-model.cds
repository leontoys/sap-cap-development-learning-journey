namespace epm.db;//to uniquely identify the project

using { cuid } from '@sap/cds/common';
using { epm.commons } from './common'; //if we don't give dot the last name after dot is taken as alias



context master { //for grouping

    entity employees : cuid { //no need to give id in the csv file
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

    entity businesspartner {
        key NODE_KEY : commons.Guid;
        BP_ROLE : String(2);
        EMAIL_ADDRESS : String(105);
        PHONE_NUMBER : String(32);
        FAX_NUMBER : String(32);
        WEB_ADDRESS : String(44);
        BP_ID : String(32);
        COMPANY_NAME : String(250);
        //foreign key
        ADDRESS_GUID : Association to one address;
    }

    entity address  {
        key NODE_KEY : commons.Guid;
        CITY : String(44);
        POSTAL_CODE : String(8);
        PHONE_NUMBER : String(32);
        STREET   : String(44);
        BUILDING : String(128);
        COUNTRY : String(44);
        ADDRESS_TYPE : String(44);
        VAL_START_DATE : Date;
        VAL_END_DATE : Date;
        LATITUDE : Decimal;
        LONGITUDE : Decimal;  
        //backward relation - not mandatory
        businesspartner : Association to one businesspartner on
        businesspartner.ADDRESS_GUID = $self //refers to the primary key of current table primary keyNODE_KEY
        }
    
}
