/*==============================================================*/
/* DBMS name:      Microsoft Access 2007                        */
/* Created on:     18.01.2023 13:56:07                          */
/*==============================================================*/


alter table CREW
   drop constraint FK_CREW_CREW_SHIP_SHIPS;

alter table OFFICERS
   drop constraint FK_OFFICERS_OFF_SHIPS_SHIPS;

alter table OFFICERS
   drop constraint FK_OFFICERS_OFF_VMB_VMB;

alter table PRUCHALU
   drop constraint FK_PRUCHALU_VMB_PRUCH_VMB;

alter table SHIPS
   drop constraint FK_SHIPS_VMB_SHIP_VMB;

drop table CREW;

drop table OFFICERS;

drop table PRUCHALU;

drop table SHIPS;

drop table VMB;

/*==============================================================*/
/* Table: CREW                                                  */
/*==============================================================*/
create table CREW
(
    ID_CREW              INTEGER         not null,
    ID_SHIP              INTEGER         not null,
    PIB                  NOTE,
    ZVANIY               NOTE,
    POSADA               NOTE
);

/*==============================================================*/
/* Table: OFFICERS                                              */
/*==============================================================*/
create table OFFICERS
(
    ID_OFF               INTEGER         not null,
    ID_SHIP              INTEGER         not null,
    ID_VMB               INTEGER         not null,
    PIB                  NOTE,
    AGE                  INTEGER,
    PHOTO                GENERAL,
    POSADA               NOTE,
    ADRESS               NOTE,
    TELEPHONE            NOTE,
    OSVITA               NOTE
);

/*==============================================================*/
/* Table: PRUCHALU                                              */
/*==============================================================*/
create table PRUCHALU
(
    ID_PRUCHALU          INTEGER         not null,
    ID_VMB               INTEGER         not null,
    LENDTH               INTEGER,
    DEEP                 INTEGER
);

/*==============================================================*/
/* Table: SHIPS                                                 */
/*==============================================================*/
create table SHIPS
(
    ID_SHIP              INTEGER         not null,
    ID_VMB               INTEGER         not null,
    TYPE                 NOTE,
    NAME                 NOTE,
    NUMBER               INTEGER,
    COMMANDER            NOTE,
    TTX                  NOTE,
    ZVANIY               NOTE
);

/*==============================================================*/
/* Table: VMB                                                   */
/*==============================================================*/
create table VMB
(
    ID_VMB               INTEGER         not null,
    NUM_VCH              NOTE,
    COMMANDER            NOTE,
    PUNKT_DUSLOKATSIY    NOTE
);

alter table CREW
   add constraint FK_CREW_CREW_SHIP_SHIPS foreign key (ID_SHIP)
      references SHIPS (ID_SHIP);

alter table OFFICERS
   add constraint FK_OFFICERS_OFF_SHIPS_SHIPS foreign key (ID_SHIP)
      references SHIPS (ID_SHIP);

alter table OFFICERS
   add constraint FK_OFFICERS_OFF_VMB_VMB foreign key (ID_VMB)
      references VMB (ID_VMB);

alter table PRUCHALU
   add constraint FK_PRUCHALU_VMB_PRUCH_VMB foreign key (ID_VMB)
      references VMB (ID_VMB);

alter table SHIPS
   add constraint FK_SHIPS_VMB_SHIP_VMB foreign key (ID_VMB)
      references VMB (ID_VMB);

