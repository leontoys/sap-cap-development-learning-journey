using { managed , Currency, sap } from '@sap/cds/common';
namespace sap.capire.bookshop;



entity Books : managed {//means it adds fields like createdat,by,updatedat,by
    key ID : Integer;
    title : localized String(111);
    description : localized String(1111);
    author : Association to Authors;//what?
    genre : Association to Genres;//what?
    stock : Integer;
    price : Decimal(9, 2);
    currency : Currency;
}

entity Authors : managed {
    key ID : Integer;
    name : String(111);
    books : Association to many Books on books.author = $self;//what is the convention?
}

entity Genres : sap.common.CodeList {//what is a codelist?
    key ID : Integer;
    parent : Association to Genres;//what is this?
    children : Composition of many Genres on children.parent = $self;//what does this mean?
}