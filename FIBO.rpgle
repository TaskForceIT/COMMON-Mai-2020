**free

Ctl-Opt Main(Main)
  Option(*SrcStmt)
  DftActGrp(*No)
  ActGrp(*Caller);

Dcl-Proc Main;
  Dcl-Pi *N Extpgm('FIBO');
    dcl-parm Eingabe Packed(5);
    dcl-parm Ausgabe Packed(20) options(*nopass);
  End-Pi;

  Ausgabe = Fibonacci(Eingabe);

  Return;
End-proc;

Dcl-Proc Fibonacci;
  Dcl-PI *N Int(20);
    Eingabe Int(5) Value;
  END-PI;
  Dcl-S tmp Int(20) Inz(0);

  if Eingabe < 2;
    Return 0;
  ENDIF;
  if Eingabe = 2;
    Return 1;
  ENDIF;
  if Eingabe > 2;
    tmp = Fibonacci(Eingabe - 1) + Fibonacci(Eingabe -2);
    Return tmp;
  ENDIF;
END-PROC;

Dcl-Proc openFile;
  Dcl-Pi *N Ind;
  End-Pi;

  Dcl-S retCode Ind Inz(*On);

  Monitor;
    // Open Dialog;
  On-Error;
    retCode = *Off;
  Endmon;

  Return retCode;
End-Proc;

Dcl-Proc closeFile;
  Dcl-Pi *N Ind;
  End-Pi;

  Monitor;
    // Close *All;
  On-Error;
    Return *Off;
  Endmon;

  Return *On;
End-Proc; 