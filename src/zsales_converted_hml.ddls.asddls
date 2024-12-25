@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Conversión de moneda'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSALES_CONVERTED_HML
  as select from /dmo/booking
{
  currency_code as OriginalCurrency,
  @Semantics.amount.currencyCode: 'OriginalCurrency'
  flight_price as OriginalPrice,
  cast( 'USD' as abap.cuky ) as ConvertedCurrency,
  @Semantics.amount.currencyCode: 'ConvertedCurrency' 
  currency_conversion( amount => flight_price, 
                       source_currency => currency_code, 
                       target_currency => abap.cuky'USD', 
                       exchange_rate_date => flight_date , 
                       error_handling     => 'SET_TO_NULL' ) as ConvertedPrice
}
