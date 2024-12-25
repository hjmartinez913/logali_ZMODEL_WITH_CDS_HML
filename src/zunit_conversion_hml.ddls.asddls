@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Conversión de cantidad'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZUNIT_CONVERSION_HML as select from /dmo/fsa_root_a
{
 key    id as ID,
 string_property as StringProperty,
 uom as OriginalUnit,
 @Semantics.quantity.unitOfMeasure: 'OriginalUnit'
 field_with_quantity as OriginalQty,
 @Semantics.quantity.unitOfMeasure: 'ConvertedUnit'
 unit_conversion( quantity => field_with_quantity,
                  source_unit => uom, 
                  target_unit => abap.unit'W',
                  error_handling => 'SET_TO_NULL' ) as ConvertedQty,
 abap.unit'W' as ConvertedUnit
}
