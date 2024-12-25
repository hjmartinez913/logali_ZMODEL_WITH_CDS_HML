@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Asociación explicita'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_EXPLICIT_JOIN_HML as select from /dmo/customer as Customer
association [1..*] to /dmo/booking as _Booking on _Booking.customer_id = Customer.customer_id
{
    Customer.customer_id as CustomerId,
    concat_with_space( Customer.first_name, Customer.last_name, 2 ) as CustomertName,
    _Booking[inner].booking_date as BookingDate
}
