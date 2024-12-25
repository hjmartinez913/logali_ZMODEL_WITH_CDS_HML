CLASS zcl_patch_express_hml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ZCL_PATCH_EXPRESS_HML IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    SELECT FROM zcds_public_assoc_hml AS Travel
    FIELDS Travel~AgencyId,
           Travel~TravelId,
           \_Agency-name AS AgencyName
     INTO TABLE @DATA(lt_outtab).

    IF sy-subrc EQ 0.
      out->write( lt_outtab ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
