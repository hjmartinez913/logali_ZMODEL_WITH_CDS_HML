@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Parámetros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPARAM_CDS_HML 
with parameters
 pFlightDate : abap.dats
 as select from /dmo/booking
{
    key travel_id as TravelID,
    key booking_id as BookingID,
    customer_id as CustomerID,
    $parameters.pFlightDate as FlightDate 
} 
where flight_date = $parameters.pFlightDate
