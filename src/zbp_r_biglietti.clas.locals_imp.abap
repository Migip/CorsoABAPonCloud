CLASS lhc_componenti DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS:
        get_global_authorizations FOR GLOBAL AUTHORIZATION
            IMPORTING REQUEST requested_authorizations FOR Componenti RESULT result.

ENDCLASS.

CLASS lhc_componenti IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zr_biglietti DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Biglietto
        RESULT result,
      earlynumbering_create FOR NUMBERING
        IMPORTING entities FOR CREATE Biglietto.
ENDCLASS.

CLASS lhc_zr_biglietti IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
*    SELECT MAX( IdBiglietto )
*      FROM zr_biglietti
*      INTO @DATA(lv_max_id).
    WITH +big AS (
        SELECT MAX( IdBiglietto ) AS IdBiglietto
            FROM zr_biglietti
        UNION
        SELECT MAX( IdBiglietto ) AS IdBiglietto
            FROM zbiglietti_d )
      SELECT MAX( big~IdBiglietto )
        FROM +big AS big
        INTO @DATA(lv_max_id).
    LOOP AT entities
        INTO DATA(ls_entity).
      lv_max_id += 1.
      APPEND VALUE #(
          %cid = ls_entity-%cid
          %is_draft = ls_entity-%is_draft
          IdBiglietto = lv_max_id )
          TO mapped-biglietto.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
