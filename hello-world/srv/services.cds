using { cuid,managed, Country } from '@sap/cds/common';
using from '@sap/cds-common-content';

service bookshop  {
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
}