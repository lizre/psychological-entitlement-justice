

RECODE @_11 ('debriefing'='1') (ELSE='0').
EXECUTE.

***change to numeric

FILTER OFF.
USE ALL.
SELECT IF (@_11=1).
EXECUTE.

***Demos

FILTER OFF.
USE ALL.
SELECT IF (citizenship='us').
EXECUTE.

COMPUTE age = 2014 - birthyear.
   EXECUTE.

FILTER OFF.
USE ALL.
SELECT IF (age>17).
EXECUTE.


***Reliability 

RELIABILITY
  /VARIABLES=PES1 PES2 PES3 PES4 PES5 PES6 PES7 PES8
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

COMPUTE PES_avg=MEAN(PES1,PES2, PES3,PES4, PES5, PES6, PES7, PES8).


COMPUTE PES_avg=(PES1+PES2+PES3+PES4+PES5+PES6+PES7+PES8)/8.



***Values.


RELIABILITY
  /VARIABLES= ssvsachievement1 ssvsachievement2 ssvsachievement3 ssvsachievement4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES= ssvspower1 ssvspower2 ssvspower3 ssvspower4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES= ssvspower1 ssvspower2 ssvspower3 ssvspower4 ssvsachievement1 ssvsachievement2 ssvsachievement3 ssvsachievement4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.


COMPUTE power=MEAN(ssvspower1,ssvspower2,ssvspower3,ssvspower4).
EXECUTE.

COMPUTE achievement=MEAN(ssvsachievement1,ssvsachievement2,ssvsachievement3,ssvsachievement4).
EXECUTE.

COMPUTE selfenhan=MEAN(ssvsachievement1, ssvsachievement2, ssvsachievement3, ssvsachievement4, ssvspower1, ssvspower2, ssvspower3, ssvspower4).
EXECUTE.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CI(95)
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT selfenhan
  /METHOD=ENTER PES_avg.
