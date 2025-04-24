CLASS z_crud_unmanged DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    CLASS-METHODS : create_data IMPORTING ls_struct TYPE zpctable,
      update_data IMPORTING ls_struct TYPE zpctable,
      delete_data IMPORTING ls_struct TYPE zpctable,save,
      createCh_data IMPORTING ls_struct TYPE zpcchtable,
      updateCh_data IMPORTING ls_struct TYPE zpcchtable ,
      deleteCh_data IMPORTING ls_struct TYPE zpcchtable.



  PROTECTED SECTION.

  PRIVATE SECTION.
    CLASS-DATA: gv_create TYPE TABLE OF zpctable.
    CLASS-DATA : gv_delete TYPE TABLE OF zpctable.
    CLASS-DATA : gv_update TYPE TABLE OF zpctable.
    CLASS-DATA : gv_chCreate TYPE TABLE OF zpcchtable.
    CLASS-DATA : gv_chUpdate TYPE TABLE OF zpcchtable.
    CLASS-DATA : gv_chDelete TYPE TABLE OF zpcchtable.

ENDCLASS.



CLASS z_crud_unmanged IMPLEMENTATION.


  METHOD create_data.

    APPEND ls_struct TO gv_create.

  ENDMETHOD.

  METHOD delete_data.
    APPEND ls_struct TO gv_delete.

  ENDMETHOD.

  METHOD update_data.

    APPEND ls_struct TO gv_update.


  ENDMETHOD.

  METHOD save.

    IF gv_create IS NOT INITIAL.
      INSERT zpctable FROM TABLE @gv_create.
    ENDIF.
    IF gv_chcreate IS NOT INITIAL.
      INSERT zpcchtable FROM TABLE @gv_chcreate.
    ENDIF.

    IF  gv_update IS NOT INITIAL.
      MODIFY zpctable FROM TABLE @gv_update.
    ENDIF.

    IF gv_chupdate IS   NOT INITIAL.
      MODIFY zpcchtable FROM TABLE @gv_chupdate.
    ENDIF.
    IF gv_chdelete IS NOT INITIAL.
      DATA: ls_ids TYPE RANGE OF zpcchtable-addid.
      DATA: lv_guid TYPE RANGE OF int1.
      ls_ids = VALUE #( FOR ls_id IN gv_chdelete ( low = ls_id-addid option = 'EQ' sign = 'I' ) ).

      DELETE FROM zpcchtable WHERE  addid IN @ls_ids.
    ENDIF.

    IF gv_delete IS NOT INITIAL.
      DATA: lv_id TYPE RANGE OF zpcchtable-addid.

      DATA: lv_guids TYPE RANGE OF int1.

      lv_id = VALUE #( FOR ls_id IN gv_chdelete ( low = ls_id-addid option = 'EQ' sign = 'I' ) ).
      lv_guids = VALUE #( FOR ls_guid IN gv_delete ( low = ls_guid-id option = 'EQ' sign = 'I' ) ).

      DELETE FROM zpctable WHERE id IN @lv_guids.
      DELETE FROM zpcchtable WHERE refempid IN @lv_guids .
    ENDIF.
  ENDMETHOD.

  METHOD createch_data.
    APPEND ls_struct TO gv_chcreate.
  ENDMETHOD.

  METHOD deletech_data.
    APPEND ls_struct TO gv_chdelete.
  ENDMETHOD.

  METHOD updatech_data.
    APPEND ls_struct TO gv_chupdate.
  ENDMETHOD.

ENDCLASS.
