@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Asociación de vuelos'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_PARAM_ASSOC_HML with parameters pCarrierID : /dmo/carrier_id
  as select from /dmo/flight  as Flight 
    association [0..1]  to /dmo/carrier as _Carrier on _Carrier.carrier_id = Flight.carrier_id
{
  key Flight.carrier_id    as CarrierID,
  key Flight.connection_id as ConnectionID,
  key Flight.flight_date   as FlightDate,
      _Carrier.name        as CarrierName
} where $projection.carrierid = $parameters.pCarrierID

