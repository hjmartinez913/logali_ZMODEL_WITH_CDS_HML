@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Lista de Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDATA_MODELING_HML
  as select from /dmo/customer
{
  key cast( customer_id as abap.int8 ) as customerID,
      first_name,
      last_name,
      $session.system_date as dateSystem,
      $session.client as clientSystem,
      case country_code
        when 'US' then 'United States'
        when 'DE' then 'Germany'
        else 'Other country'
      end as countryName
    
//      cast( cast( 'E' as abap.lang ) as sylangu preserving type ) as languageElement
}
