**free

Ctl-Opt Main(Main)
  Option(*SrcStmt)
  DftActGrp(*No)
  ActGrp(*Caller);

Dcl-F Dialog Workstn
             Handler('PROFOUNDUI(HANDLER)')
             Usage(*Input:*Output)
             Extdesc('ISBNRESD')
             Extfile(*Extdesc);

Dcl-Pr NODERUN EXTPGM;
  benutzer CHAR(51);
  wrkspace CHAR(75);
  token CHAR(75) const;
  isbn  CHAR(50);
  titel char(1024);
  autor char(1024);
End-Pr;

Dcl-pr ISBN EXTPGM;
  isbn CHAR(50) const;
  titel char(1024);
  autor char(1024);
END-PR;


Dcl-Proc Main;
  Dcl-Pi *N Extpgm('ISBNRESOLV');
  End-Pi;

  Dcl-s benutzer CHAR(51) INZ('KerimG');
  Dcl-s workspace CHAR(75) INZ('isbn-lookup');


  openFile();
  initialize();

  DoU ende = '1';


    exfmt START;

    If local = '1';
      ISBN(isbnnr:buchTitel:autor);
    Else;
       NODERUN(benutzer:workspace:'*NONE':isbnnr:buchTitel:autor);
    EndIf;



  EndDo;

  closeFiles();

  Return;
End-proc;

Dcl-Proc initialize;
  isbnnr = '';
  buchTitel = '';
  autor = '';
  local = *off;

End-Proc;

Dcl-proc openFile;
  Dcl-Pi *N Ind;

  End-Pi;

  Dcl-S returnCode Ind Inz(*on);

  Monitor;
    Open Dialog;
  On-Error;
    returnCode = *off;
  EndMon;

  Return returnCode;
End-Proc;


Dcl-Proc closeFiles;
  Dcl-Pi *N Ind;
  End-Pi;

  Monitor;
    Close *All;
  On-Error;
    Return *Off;
  Endmon;

  Return *On;
End-Proc; 