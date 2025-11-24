namespace epm.commons;

using { Currency } from '@sap/cds/common';


//reusable for node key
type Guid : String(32);

//enumerator
type Gender : String(1) enum{
    male = 'M' ;
    female = 'F';
    other = 'O'
};

//when we show amount field we show along currency 
//for quantity, unit of measure
type AmountT : Decimal(10,2) @( //annotation
    Semantics.amount.currencyCode : 'CURRENCY_code',
    sap.unit : 'CURRENCY_code' //why small letter code?
);

aspect Amount : {
    currency : Currency;
    GROSS_AMOUNT : AmountT; 
    NET_AMOUNT : AmountT;
    TAX_AMOUNT : AmountT;
}

//regex - phone number and email
type PhoneNumber : String(30) @assert.format : '^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';

type EmailAddress : String(255) @Communication.IsEmailAddress;
