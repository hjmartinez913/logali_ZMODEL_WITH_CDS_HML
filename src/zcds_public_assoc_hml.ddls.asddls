@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Asociación pública de viaje'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_PUBLIC_ASSOC_HML as select from /dmo/travel as Travel
association [1..1] to /dmo/agency as _Agency on _Agency.agency_id = Travel.agency_id
{
    key Travel.travel_id as TravelId,
    Travel.agency_id as AgencyId,
    _Agency
}
