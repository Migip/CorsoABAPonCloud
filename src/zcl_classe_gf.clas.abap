CLASS zcl_classe_gf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_classe_gf IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    SELECT *
*        FROM /dmo/flight
*        INTO TABLE @DATA(lt_spfli).
*    out->write( lt_spfli ).
*    DATA(lv_1) = find( val = 'FIND Found found' sub = 'F' occ = -2 case = abap_true ).
*    DATA(lv_2) = find( val = 'find Found FOUND' sub = 'F' occ = -2 ).
*    DATA(lv_3) = find( val = 'fIND FOUND FOUND' sub = 'F' ).
*    DATA(lv_4) = find( val = 'find FOUND Found' sub = 'F' occ = -2 case = abap_false ).
*    out->write( lv_1 ).
*    out->write( lv_2 ).
*    out->write( lv_3 ).
*    out->write( lv_4 ).
    DATA:
      lt_h TYPE HASHED TABLE OF /dmo/flight
          WITH UNIQUE KEY carrier_id
                          connection_id
                          flight_date,
      lt_s TYPE SORTED TABLE OF /dmo/flight
          WITH UNIQUE KEY carrier_id
                          connection_id
                          flight_date.
*    READ TABLE lt_h
*        into data(ls_h)
*        with tABLE KEY carrier_id = '1'.
*    READ TABLE lt_s
*        into data(ls_s)
*        with tABLE KEY carrier_id = '1'.



  ENDMETHOD.
ENDCLASS.
