@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Customer'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCDS_CUST_PROJ_HML
provider contract transactional_interface
 as projection on ZCDS_CUSTOMER_ROOT_HML
{
    key customer_id,
    first_name,
    last_name,
    city,
    /* Associations */
    _Booking : redirected to composition child ZCDS_CHILD_PROJ_HML
}
