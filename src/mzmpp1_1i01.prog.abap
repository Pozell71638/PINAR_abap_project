*&---------------------------------------------------------------------*
*& Include          MZMPP1_1I01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_5001  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_5001 INPUT.

  CASE sy-ucomm.
    WHEN 'PRINT1'.
      SELECT * "EMPLOYER_ID EMPLOYER_NAME EMPLOYER_PASSWORD
          FROM zpk_admin_t
          INTO TABLE itab   WHERE  teacher_id = zpk_admin_t-teacher_id AND
                teacher_name = zpk_admin_t-teacher_name.
      IF sy-subrc = 0.
        MESSAGE 'Admin Login Successful' TYPE 'I'.


        CALL FUNCTION '/1BCDWB/SF00000073'
* EXPORTING
*   ARCHIVE_INDEX              =
*   ARCHIVE_INDEX_TAB          =
*   ARCHIVE_PARAMETERS         =
*   CONTROL_PARAMETERS         =
*   MAIL_APPL_OBJ              =
*   MAIL_RECIPIENT             =
*   MAIL_SENDER                =
*   OUTPUT_OPTIONS             =
*   USER_SETTINGS              = 'X'
* IMPORTING
*   DOCUMENT_OUTPUT_INFO       =
*   JOB_OUTPUT_INFO            =
*   JOB_OUTPUT_OPTIONS         =
          TABLES
            it_admin = itab
* EXCEPTIONS
*           FORMATTING_ERROR           = 1
*           INTERNAL_ERROR             = 2
*           SEND_ERROR                 = 3
*           USER_CANCELED              = 4
*           OTHERS   = 5
          .
        IF sy-subrc <> 0.
* Implement suitable error handling here
        ENDIF.












      ELSE.
        MESSAGE ' Please check your details' TYPE 'I'.
      ENDIF.
    WHEN 'DISP1'.
      SELECT SINGLE teacher_id teacher_name subject_taught number_of_classe_taken  cont_no email_adresse
         FROM zpk_admin_t
        INTO (zpk_admin_t-teacher_id, zpk_admin_t-teacher_name, zpk_admin_t-subject_taught, zpk_admin_t-number_of_classe_taken,
  zpk_admin_t-cont_no, zpk_admin_t-email_adresse)
      WHERE  teacher_id = zpk_admin_t-teacher_id.
    WHEN'CLEAR1'.
      CLEAR:zpk_admin_t-teacher_id, zpk_admin_t-teacher_name, zpk_admin_t-subject_taught, zpk_admin_t-number_of_classe_taken, zpk_admin_t-cont_no, zpk_admin_t-email_adresse.
    WHEN 'EXIT1'.
      LEAVE PROGRAM.
    WHEN 'SAVE1'.
      PERFORM save.
    WHEN 'CHANGE1'.
      PERFORM change.
    WHEN 'BACK1'.
      LEAVE TO SCREEN 0.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_5000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_5000 INPUT.



  CASE sy-ucomm.
    WHEN 'LOG1'.
      SELECT SINGLE * "EMPLOYER_ID EMPLOYER_NAME EMPLOYER_PASSWORD
        FROM zpk_employer_t
        INTO wa1   WHERE  EMPLOYER_id = zpk_employer_t-EMPLOYER_id AND
              EMPLOYER_password = zpk_employer_t-EMPLOYER_password.
      IF sy-subrc = 0.
        IF zpk_employer_t-employer_name = 'ADMIN'.
*          WRITE:/ 'WELCOME TO ADMIN PAGE.'.
*          MESSAGE 'Admin Login Successful' TYPE 'I'.
          CALL SCREEN 5001.



          SELECT SINGLE * "EMPLOYER_ID EMPLOYER_NAME EMPLOYER_PASSWORD
              FROM zpk_employer_t
              INTO wa1   WHERE  EMPLOYER_id = zpk_employer_t-EMPLOYER_id AND
                    EMPLOYER_password = zpk_employer_t-EMPLOYER_password.
*        ELSEIF  zpk_employer_t-employer_name NE 'ADMIN' .
*          CALL SCREEN 5002.
*
*          SELECT SINGLE * "EMPLOYER_ID EMPLOYER_NAME EMPLOYER_PASSWORD
*                   FROM zpk_employer_t2
*                   INTO wa3   WHERE  EMPLOYER_id = zpk_employer_t2-EMPLOYER_id AND
*                         EMPLOYER_password = zpk_employer_t2-EMPLOYER_password.

        ENDIF.
      ENDIF.
*    WHEN 'LOG1'.
*      IF zpk_employer_t-employer_ID = 'E04' AND
*        zpk_employer_t-EMPLOYER_password = 'ADMIN123'.
*        CALL SCREEN 5001.
*
*
*
*      ELSEIF zpk_employer_t-employer_ID = 'E03' AND
*        zpk_employer_t-EMPLOYER_password = 'SHELTON123'.
*        CALL SCREEN 5002.
*      ENDIF.
*
*      SELECT SINGLE * "EMPLOYER_ID EMPLOYER_NAME EMPLOYER_PASSWORD
*        FROM zpk_employer_t
*        INTO wa1   WHERE  EMPLOYER_id = zpk_employer_t-EMPLOYER_id AND
*              EMPLOYER_password = zpk_employer_t-EMPLOYER_password.
*      IF sy-subrc = 0.
*        CALL SCREEN 5000.
*
*
*      ELSE.
*        MESSAGE ' Please check your details' TYPE 'I'.
*      ENDIF.
*  ENDCASE.



  ENDCASE.

  CASE sy-ucomm.
    WHEN 'LOG2'.

      SELECT SINGLE * "EMPLOYER_ID EMPLOYER_NAME EMPLOYER_PASSWORD
        FROM zpk_employer_t2
        INTO wa3   WHERE  EMPLOYER_id = zpk_employer_t2-EMPLOYER_id AND
              EMPLOYER_password = zpk_employer_t2-EMPLOYER_password.
      IF sy-subrc = 0.
        IF zpk_employer_t2-employer_name NE 'ADMIN'.
      CALL SCREEN 5002.

      ENDIF.
      ENDIF.
      ENDCASE.


ENDMODULE.

*CASE sy-ucomm.
*    WHEN 'LOG1'.
*      IF zpk_employer_t-employer_ID = 'E04' AND
*        zpk_employer_t-EMPLOYER_password = 'ADMIN123'.
*          CALL SCREEN 2024.
*       ENDIF.
*
*      SELECT SINGLE * "EMPLOYER_ID EMPLOYER_NAME EMPLOYER_PASSWORD
*        FROM zpk_employer_t
*        INTO wa1   WHERE  EMPLOYER_id = zpk_employer_t-EMPLOYER_id AND
*              EMPLOYER_password = zpk_employer_t-EMPLOYER_password.
*      IF sy-subrc = 0.
*        CALL SCREEN 2025.
*      ENDIF.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_5002  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_5002 INPUT.
  CASE sy-ucomm.
    WHEN 'LOG1'.
      SELECT SINGLE * "EMPLOYER_ID EMPLOYER_NAME EMPLOYER_PASSWORD
          FROM ztea_GP1
          INTO wa2
          WHERE  student_id = ztea_gp1-student_id
          AND student_name = ztea_gp1-student_name.
      IF sy-subrc = 0.
        MESSAGE 'Teacher Loged In Successful' TYPE 'I'.

      ELSE.
        MESSAGE ' Please check your Credentials ' TYPE 'I'.
      ENDIF.
    WHEN 'DISP1'.
      SELECT SINGLE student_id student_name subject marks  class contact email
         FROM ztea_gp1
        INTO (ztea_gp1-student_id, ztea_gp1-student_name, ztea_gp1-subject, ztea_gp1-marks, ztea_gp1-class, ztea_gp1-contact,
        ztea_gp1-email)
      WHERE  student_id = ztea_gp1-student_id.
    WHEN'CLEAR1'.
      CLEAR:ztea_gp1-student_id, ztea_gp1-student_name, ztea_gp1-subject, ztea_gp1-marks, ztea_gp1-class, ztea_gp1-contact,
        ztea_gp1-email.
    WHEN 'EXIT1'.
      LEAVE PROGRAM.
    WHEN 'SAVE2'.
      PERFORM save1.
    WHEN 'CHANGE1'.
      PERFORM change.
    WHEN 'BACK1'.
      LEAVE TO SCREEN 0.
      " WHEN 'PRINT1'

  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Form save1
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM save1 .

ENDFORM.
