@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDs Flight Categoria de Datos analíticos'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Analytics.dataCategory: #CUBE

define view entity ZCDS_AN_DATA_FLIGHT_HML
  as select from /dmo/booking as Booking
  association [0..1] to ZCDS_VDM_FLIGHT_HML as _Flight on  _Flight.CarrierId    = $projection.CarrierId
                                                       and _Flight.ConnectionId = $projection.ConnectionId
                                                       and _Flight.FlightDate   = $projection.FlightDate
{
  key Booking.travel_id     as TravelId,
  key Booking.booking_id    as BookingId,
      Booking.booking_date  as BookingDate,
      Booking.customer_id   as CustomerId,
      Booking.carrier_id    as CarrierId,
      Booking.connection_id as ConnectionId,
      Booking.flight_date   as FlightDate,

      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Booking.flight_price  as FlightPrice,
      Booking.currency_code as CurrencyCode,
      _Flight
}
