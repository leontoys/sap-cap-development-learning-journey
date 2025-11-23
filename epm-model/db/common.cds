namespace epm.commons;

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
    Semantics.amount.currencyCode : 'CURRENCY_CODE',
    sap.unit : 'CURRENCY_CODE'
);

//regex - phone number and email
type PhoneNumber : String(30) @assert.format : '^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';

type EmailAddress : String(255) @Communication.IsEmailAddress;
