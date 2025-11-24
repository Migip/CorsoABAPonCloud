CLASS zcl_fill_sex DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fill_sex IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA:
      lt_sex TYPE TABLE OF zsex,
      ls_sex LIKE LINE OF lt_sex.
    lt_sex = VALUE #( (
        sex = 'M'
        meaning = 'Maschio'
        cromosoma = 'XY' )
        (
        sex = 'F'
        meaning = 'Femmina'
        cromosoma = 'XX' ) ).
    MODIFY zsex
        FROM TABLE @lt_sex.
    IF sy-subrc IS INITIAL.
      COMMIT WORK.
      out->write( name = 'OK' data = lt_sex ).
    ELSE.
      out->write( 'KO' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
