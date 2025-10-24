using { cuid,managed, Country } from '@sap/cds/common';


service bookshop  {
    entity Books: cuid, managed {
        title : String;
    }
    entity Authors : cuid, managed {
        name : String;
        countryOfBirth : Country;
    }
}