@EndUserText.label: 'CDS Custom Detail'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CUSTOM_DETAIL_HML'
define custom entity ZCDS_CUSTOM_DETAIL_HML
{
  key customer_id:  /dmo/customer_id;
  phone_number : /dmo/phone_number;
  email_address: /dmo/email_address;
}
