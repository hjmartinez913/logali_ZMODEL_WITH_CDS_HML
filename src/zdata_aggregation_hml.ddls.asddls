@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Agregación'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDATA_AGGREGATION_HML
  as select from /dmo/booking
{
  currency_code     as CurrencyCode,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum(flight_price) as SumFlightPrice
}
group by
  currency_code
