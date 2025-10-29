using { cuid,managed, Country } from '@sap/cds/common';
using from '@sap/cds-common-content';

namespace org.liyon;


    entity Books: cuid, managed {
        title : String;
        author : Association to Authors;
        //also_author : Association to Authors;//creates a field author_ID here
        //author_foreign_key : type of Authors:ID;//now we have to create assosciate manually
        //author_association : Association to Authors on author_association.ID = author_foreign_key;
    }
    entity Authors : cuid, managed {
        name : String;
        countryOfBirth : Country;
        books : Association to many Books on books.author = $self;
    }

entity Orders : cuid { 
  //Items : Composition of many OrderItems on Items.parent = $self;
  headertext : String;
  Items : Composition of many { //this creates items entity with key up_
  key pos : Integer;
  quantity : Integer;
  itemtext : String;    
  }
}
//entity OrderItems { // to be accessed through Orders only
//  key parent : Association to Orders;
//  key pos : Integer;
//  quantity : Integer;
//  itemtext : String;
//}