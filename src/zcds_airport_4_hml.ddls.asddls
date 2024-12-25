@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDs Vuelos - Access Control 4'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcds_airport_4_HML as select from /dmo/airport
{
    key airport_id as AirportId,
    name as Name,
    city as City,
    country as Country,
    cast ( '01' as zde_flight_type_hml ) as FlightType
}
