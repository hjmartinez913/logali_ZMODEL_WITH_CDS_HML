@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociación PArent Child Agencias'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity ZCDS_CUST_BOOK_HML
  as select from /dmo/booking
  association to parent ZCDS_CUSTOMER_ROOT_HML as _Customer on _Customer.customer_id = $projection.customer_id
{
  key customer_id,
  key travel_id,
      booking_id,
      _Customer
}
