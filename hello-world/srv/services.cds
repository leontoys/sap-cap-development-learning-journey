using { cuid,managed, Country } from '@sap/cds/common';
using from '@sap/cds-common-content';

service bookshop  {
    entity Books: cuid, managed {
        title : String;
        author : Association to Authors;
    }
    entity Authors : cuid, managed {
        name : String;
        countryOfBirth : Country;
    }
}