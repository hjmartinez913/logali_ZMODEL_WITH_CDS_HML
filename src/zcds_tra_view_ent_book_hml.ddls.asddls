@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'CDS Booking Transiet View Entity'
@Metadata.ignorePropagatedAnnotations: true
define transient view entity ZCDS_TRA_VIEW_ENT_BOOK_HML 
provider contract analytical_query
as projection on ZCDS_AN_DATA_FLIGHT_HML
{
   @AnalyticsDetails.query.axis: #FREE
   TravelId,
   
   @AnalyticsDetails.query.axis: #ROWS
   BookingId,
   BookingDate,
   
   @AnalyticsDetails.query.axis: #COLUMNS
   CustomerId,
   
   CarrierId,
   ConnectionId,
   FlightDate,
   
   @Semantics.amount.currencyCode: 'currcode'
   FlightPrice,
   CurrencyCode,
   
   virtual currcode : abap.cuky,
   /* Associations */
   _Flight
}
