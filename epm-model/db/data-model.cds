namespace epm.db;//to uniquely identify the project

using { cuid, Currency } from '@sap/cds/common';
using { epm.commons } from './common'; //if we don't give dot the last name after dot is taken as alias


context master { //for grouping
    entity employees : cuid { //no need to give id in the csv file
        //key empId : String(32);
        nameFirst : String(40);
        nameMiddle : String(40);
        nameLast : String(40);
        nameInitials : String(40);
        sex : commons.Gender;//String(1);
        language : String(1);
        phoneNumber : commons.PhoneNumber;//;(20);
        email : commons.EmailAddress;//String(30);
        loginName : String(32);
        //Currency : String(4);
        currency : Currency ;//why it is currency_code in the file?
        salaryAmount : commons.AmountT ;//Decimal(10, 2);
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
    

    entity product {
    key NODE_KEY : commons.Guid;
    PRODUCT_ID : String(28);
    TYPE_CODE : String(2);
    CATEGORY : String(32);
    DESCRIPTION : localized  String(255);
    SUPPLIER_GUID : Association to businesspartner;
    TAX_TARIFF_CODE : Integer;
    MEASURE_UNIT : String(2);
    WEIGHT_MEASURE : Decimal(15,2);
    WEIGHT_UNIT : String(2);
    CURRENCY : Currency;//why upper case?
    PRICE : Decimal(15, 2);
    WIDTH: Decimal(15, 2);
    DEPTH: Decimal(15, 2);
    HEIGHT: Decimal(15, 2);
    DIM_UNIT : String(2);
}
}

context transaction {
    entity purchaseorder : commons.Amount {
        key NODE_KEY : commons.Guid;
        PO_ID : String(40);
        PARTNER_GUID : Association to one master.businesspartner;
        LIFECYCLE_STATUS : String(1);
        OVERALL_STATUS : String(1);
        Items : Composition of many poitems on Items.PARENT_KEY = $self
    }

    entity poitems : commons.Amount{
        key NODE_KEY : commons.Guid;
        PARENT_KEY : Association to one purchaseorder;
        PO_ITEM_POS : Integer;
        PRODUCT_GUID : Association to one master.product;
    };
}
