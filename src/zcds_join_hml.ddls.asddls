@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Inner Join Vuelos'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_JOIN_HML as select from /dmo/booking as Booking
inner join /dmo/flight as Flight on Flight.carrier_id = Booking.carrier_id
                                and Flight.connection_id = Booking.connection_id
                                and Flight.flight_date = Booking.flight_date
{
    key Booking.booking_id as BookingID,
    Flight.flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Flight.price as FlightPrice,
    Flight.currency_code as CurrencyCode
}
