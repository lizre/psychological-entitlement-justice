***Demos

COMPUTE age = 2015 - birthyear.
   EXECUTE.

FILTER OFF.
USE ALL.
SELECT IF (age>17).
EXECUTE.


**added 0s for lowent/control, 1 for entitlement condition

***Reliability of Values.

RELIABILITY
  /VARIABLES= ssvspower1 ssvspower2 ssvspower3 ssvspower4 ssvsachievement1 ssvsachievement2 ssvsachievement3 ssvsachievement4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

.79


COMPUTE selfenhan=MEAN(ssvsachievement1, ssvsachievement2, ssvsachievement3, ssvsachievement4, ssvspower1, ssvspower2, ssvspower3, ssvspower4).
EXECUTE.


***justice measures

RELIABILITY
  /VARIABLES= retribjorient1 retribjorient2 retribjorient3 retribjorient4 retribjorient5 retribjorient6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

.86

RELIABILITY
  /VARIABLES= crimethreat1 crimethreat2 crimethreat3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

.80

RELIABILITY
  /VARIABLES= statusresmot1 statusresmot2
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

.82

COMPUTE retribjorient=MEAN(retribjorient1,retribjorient2,retribjorient3,retribjorient4,retribjorient5,retribjorient6).
EXECUTE.

COMPUTE crimethreat=MEAN(crimethreat1,crimethreat2,crimethreat3).
EXECUTE.

COMPUTE statusresmot=MEAN(statusresmot1,statusresmot2).
EXECUTE.

RECODE @_4 ("lowent"=0) ("hient"=1) INTO entcond.

RECODE remcode1 (SYSMIS=0).
EXECUTE.

RECODE remcode2 (SYSMIS=0).
EXECUTE.



USE ALL.
COMPUTE filter_$=(remcode1RA3 = 0 OR remcode1RA3 =1 AND remcode2RA3 = 0 OR remcode2RA3 =1).
VARIABLE LABELS filter_$ 'remcode1 = 0 AND remcode2 = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.
