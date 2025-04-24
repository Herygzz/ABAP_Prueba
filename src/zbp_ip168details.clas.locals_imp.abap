CLASS lhc_zi168chdetails DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zi168Chdetails.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zi168Chdetails.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi168Chdetails RESULT result.

    METHODS rba_Parent FOR READ
      IMPORTING keys_rba FOR READ zi168Chdetails\_Parent FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_zi168chdetails IMPLEMENTATION.

  METHOD update.

    DATA : ls_struct TYPE zpcchtable.

    LOOP AT entities INTO DATA(ls_data).
      ls_struct = CORRESPONDING #( ls_data ).
      SELECT SINGLE * FROM zpcchtable WHERE addid =  @ls_data-Addid INTO @DATA(lp_data).
      ls_struct =  VALUE #( addid = ls_data-Addid refempid = ls_data-Refempid address = COND #( WHEN  ls_data-%control-Address = if_abap_behv=>mk-on THEN ls_data-Address ELSE lp_data-address  )
      country = COND #( WHEN ls_data-%control-Country = if_abap_behv=>mk-on THEN ls_data-Country ELSE lp_data-country )
      zipcode = COND #( WHEN ls_data-%control-Zipcode = if_abap_behv=>mk-on THEN ls_data-Zipcode ELSE lp_data-zipcode )
       ).
       mapped-zi168chdetails = VALUE #( BASE mapped-zi168chdetails (  %cid = ls_data-%cid_ref Addid = ls_data-Addid Refempid = ls_data-Refempid ) ).

      z_crud_unmanged=>updatech_data( ls_struct = ls_struct ).
    ENDLOOP.

  ENDMETHOD.

  METHOD delete.
    DATA : ls_struct TYPE zpcchtable.
    LOOP AT keys INTO DATA(ls_data).
      ls_struct = CORRESPONDING #( ls_data ).
      z_crud_unmanged=>deletech_data( ls_struct = ls_struct ).
    ENDLOOP.

  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Parent.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zip168details DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save REDEFINITION.
    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zip168details IMPLEMENTATION.

  METHOD save.
    z_crud_unmanged=>save(  ).

  ENDMETHOD.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zip168details DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zip168details RESULT result.
    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zip168details.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zip168details.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zip168details.

    METHODS read FOR READ
      IMPORTING keys FOR READ zip168details RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zip168details.

    METHODS rba_child FOR READ
      IMPORTING keys_rba FOR READ zip168details\_child FULL result_requested RESULT result LINK association_links.

    METHODS cba_child FOR MODIFY
      IMPORTING entities_cba FOR CREATE zip168details\_child.

ENDCLASS.

CLASS lhc_zip168details IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    DATA : ls_struct TYPE zpctable.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<entitystruct>).
      ls_struct = CORRESPONDING #( <entitystruct> ).
      mapped-zip168details = VALUE #( ( %cid = <entitystruct>-%cid Id = <entitystruct>-Id ) ).
      z_crud_unmanged=>create_data( ls_struct = ls_struct  ).
    ENDLOOP.

  ENDMETHOD.

  METHOD update.


    DATA : ls_struct TYPE zpctable.
    LOOP AT entities INTO DATA(ls_header).
      SELECT SINGLE * FROM zpctable WHERE id = @ls_header-id INTO @DATA(ls_data).

      ls_struct = VALUE #( id = ls_header-Id   age = COND #( WHEN ls_header-%control-Age = if_abap_behv=>mk-on THEN ls_header-Age ELSE ls_data-age )
      name = COND #( WHEN ls_header-%control-Name = if_abap_behv=>mk-on THEN ls_header-Name ELSE ls_data-age )
       ).
      z_crud_unmanged=>update_data( ls_struct = ls_struct  ).
    ENDLOOP.
  ENDMETHOD.

  METHOD delete.

    DATA : ls_struct TYPE zpctable.
    LOOP AT keys INTO DATA(deletekey).
      MOVE-CORRESPONDING deletekey TO ls_struct.
      z_crud_unmanged=>delete_data( ls_struct = ls_struct  ).
    ENDLOOP.

  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Child.
  ENDMETHOD.

  METHOD cba_Child.

    LOOP AT entities_cba INTO DATA(ls_header).
      DATA : ls_struct TYPE zpcchtable.
      LOOP AT ls_header-%target INTO DATA(ls_child).
        MOVE-CORRESPONDING ls_child TO ls_struct.
        ls_struct-refempid = ls_header-Id.
      ENDLOOP.
    ENDLOOP.
    z_crud_unmanged=>createch_data( ls_struct = ls_struct ).
  ENDMETHOD.

ENDCLASS.
