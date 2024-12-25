@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'CDS Vuelos jerarquico'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity ZCDS_FLIGHT_HIERA_HML
  as select from /dmo/travel
  association [1..1] to ZCDS_FLIGHT_HIERA_HML as _Agency on  _Agency.AgencyId   = $projection.AgencyId
                                                         and _Agency.CustomerId = $projection.CustomerId
{
  key agency_id   as AgencyId,
  key customer_id as CustomerId,
      begin_date  as BeginDate,
      end_date as EndDate,
      _Agency
}
