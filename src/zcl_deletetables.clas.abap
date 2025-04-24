CLASS zcl_deletetables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_deletetables IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DELETE FROM zpctable.

  ENDMETHOD.

ENDCLASS.
