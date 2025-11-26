namespace epm.views;

using { epm.db.master, epm.db.transaction } from './data-model';

context cdsviews {
    //while deploying to hana it may change the view or field name to uppercase
    //to avoid this enclose it with ![]
    define view ![POWorklist] as 
    select from transaction.purchaseorder{
        key PO_ID as ![PurchaseOrderId],
        key Items.PO_ITEM_POS as ![ItemPosition],
        //PARTNER_ID as ![PartnerGuid] - we don't want to see guid, instead id
        PARTNER_ID.BP_ID as ![PartnerId],
        PARTNER_ID.COMPANY_NAME as ![CompanyName],
        Items.GROSS_AMOUNT as ![GrossAmount],
        Items.NET_AMOUNT as ![NetAmount],
        Items.TAX_AMOUNT as ![TaxAmount],
        Items.currency AS ![Currency],
        OVERALL_STATUS as ![OverallStatus],
        Items.PRODUCT_GUID.CATEGORY as ![Category],
        Items.PRODUCT_GUID.DESCRIPTION as ![Description],
        PARTNER_ID.ADDRESS_GUID.COUNTRY as ![Country],
        PARTNER_ID.ADDRESS_GUID.CITY as ![City]
    }
}


