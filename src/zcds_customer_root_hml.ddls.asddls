@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entidad raiz cliente'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCDS_CUSTOMER_ROOT_HML
  as select from /dmo/customer
  composition [0..*] of ZCDS_CUST_BOOK_HML as _Booking
//  association to /dmo/airport as _Airport on _Airport.airport_id =  
{
  key customer_id,
  first_name,
  last_name,
  city,
  _Booking
}
