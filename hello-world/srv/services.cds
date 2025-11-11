using org from '../db/schema';

extend org.liyon.Books with {
    virtual urgency : String;
}


service bookshop  {
    entity Books as projection on org.liyon.Books;

    entity Authors as projection on org.liyon.Authors;

    entity Orders as projection on org.liyon.Orders;

    function totalStock() returns Integer;

}