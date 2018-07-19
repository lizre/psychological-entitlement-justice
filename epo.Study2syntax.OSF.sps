***Demos

COMPUTE age = 2014 - birthyear.
   EXECUTE.

FILTER OFF.
USE ALL.
SELECT IF (age>17).
EXECUTE.

FILTER OFF.
USE ALL.
SELECT IF (citizenship='us').
EXECUTE.

***Reliability 

RELIABILITY
  /VARIABLES=PES1 PES2 PES3 PES4 PES5 PES6 PES7 PES8
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.


COMPUTE PES_avg=MEAN(PES1,PES2, PES3,PES4, PES5, PES6, PES7, PES8).

***Descriptives and Centering

DESCRIPTIVES VARIABLES=politicalid PES_avg expentitle
  /STATISTICS=MEAN STDDEV MIN MAX.

***justice measures

RELIABILITY
  /VARIABLES= retribjorient1 retribjorient2 retribjorient3 retribjorient4 retribjorient5 retribjorient6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES= crimethreat1 crimethreat2 crimethreat3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES= statusresmot1 statusresmot2
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.


COMPUTE retribjorient=MEAN(retribjorient1,retribjorient2,retribjorient3,retribjorient4,retribjorient5,retribjorient6).
EXECUTE.

COMPUTE crimethreat=MEAN(crimethreat1,crimethreat2,crimethreat3).
EXECUTE.

COMPUTE statusresmot=MEAN(statusresmot1,statusresmot2).
EXECUTE.



REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CI(95)
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT crimethreat
  /METHOD=ENTER PES_avg.




REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CI(95)
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT statusresmot
  /METHOD=ENTER PES_avg.





REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CI(95)
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT retribjorient
  /METHOD=ENTER PES_avg.



