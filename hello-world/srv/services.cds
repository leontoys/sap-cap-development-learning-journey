using org from '../db/schema';


service bookshop  {
    entity Books as projection on org.liyon.Books;

    entity Authors as projection on org.liyon.Authors;

    entity Orders as projection on org.liyon.Orders;

}