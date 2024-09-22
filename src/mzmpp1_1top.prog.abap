*&---------------------------------------------------------------------*
*& Include MZMPP1_1TOP                              - Module Pool      SAPMZMPP1_1
*&---------------------------------------------------------------------*
PROGRAM SAPMZMPP1_1.

TABLES:zpk_admin_t, zpk_employer_t,ztea_gp1,zpk_employer_t2.
DATA: wa TYPE zstr_admin,
      ITAB TYPE ztt_admin.

DATA: wa1 TYPE zpk_employer_t.
DATA:wa3 TYPE zpk_employer_t.
data:  wa2 Type ztea_gp1.
