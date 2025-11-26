namespace epm.views;

using { epm.db.master, epm.db.transaction } from './data-model';

context cdsviews {
    define view POWorklist as 
    select from transaction.purchaseorder{
        key PO_ID as PurchaseOrderId,
        key Items.PO_ITEM_POS as ItemPosition,
        PARTNER_ID as PartnerGuid
    }
}


