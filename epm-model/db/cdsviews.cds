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

    //Product Help View
    define view ![ProductHelpView] as 
    select from master.product{
        @EndUserText.Label : [
            {language:'EN',text:'Product ID'},
            {language:'ML',text:'ഉൽപ്പന്ന ഐഡി'}
        ]
        PRODUCT_ID as ![ProductId],
        DESCRIPTION as ![Description],
        CATEGORY as ![Category],
        PRICE as ![Price],
        CURRENCY as ![Currency],
        SUPPLIER_GUID.COMPANY_NAME as ![SuplierName]
    }   

    //Item View
    define view ![ItemView] as 
    select from transaction.poitems{
        PARENT_KEY.PARTNER_GUID.NODE_KEY as ![SupplierId],
        PRODUCT_GUID.NODE_KEY as ![ProductKey],
        GROSS_AMOUNT as ![GrossAmount],
        NET_AMOUNT as ![NetAmount],
        TAX_AMOUNT as ![TaxAmount],
        currency as ![Currency],
        PARENT_KEY.OVERALL_STATUS as ![OverallStatus]
    }
    
    //mixin - loose coupling , lazy loading
    //never load dependent data until asked{}
    define view ![ProductView] as select master.product
    Mixin {
        PO_ITEMS : Association to many ItemView on PO_ITEMS.ProductKey = $projection.ProductId
    } as mixin into {
        NODE_KEY as ![ProductId],
        DESCRIPTION as ![ProductName],
        CATEGORY as ![Category],
        SUPPLIER_GUID.BP_ID as ![SupplierId],
        SUPPLIER_GUID.COMPANY_NAME as ![SuplierName],
        SUPPLIER_GUID.ADDRESS_GUID.COUNTRY as ![Country],
        //exposed Assosciation
        PO_ITEMS as ![To_Items]
    }
        

}


