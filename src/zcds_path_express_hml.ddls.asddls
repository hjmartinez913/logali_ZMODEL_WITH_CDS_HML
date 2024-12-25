@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Asociación expresión'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_PATH_EXPRESS_HML as select from /dmo/booking as Booking
 association [0..*] to /dmo/flight as _Flight on _Flight.carrier_id = Booking.carrier_id
                                             and _Flight.connection_id = Booking.connection_id
                                             and _Flight.flight_date = Booking.flight_date
{
    Booking.booking_id as BookingId,
    Booking.travel_id as travelId,
    _Flight[1:connection_id = '0001' ].seats_occupied as SeatsOccupied
}
