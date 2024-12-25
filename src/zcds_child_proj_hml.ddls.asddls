@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection child Customer Booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_CHILD_PROJ_HML
  as projection on ZCDS_CUST_BOOK_HML
{
  key customer_id,
  key travel_id,
      booking_id,
      /* Associations */
      _Customer : redirected to parent ZCDS_CUST_PROJ_HML
}
