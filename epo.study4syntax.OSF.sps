***Demos

COMPUTE age = 2014 - birthyear.
   EXECUTE.

FILTER OFF.
USE ALL.
SELECT IF (age>17).
EXECUTE.


**added 0s for lowent/control, 1 for entitlement condition

***Reliability of Values.

RELIABILITY
  /VARIABLES= ssvsachievement1 ssvsachievement2 ssvsachievement3 ssvsachievement4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

.69

RELIABILITY
  /VARIABLES= ssvspower1 ssvspower2 ssvspower3 ssvspower4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

.73

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

.88

RELIABILITY
  /VARIABLES= crimethreat1 crimethreat2 crimethreat3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

.80

RELIABILITY
  /VARIABLES= statusresmot1 statusresmot2
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

.84

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




RECODE q1a ('yes'=1) (ELSE=0) INTO violentcrime.
EXECUTE.

RECODE q1b ('yes'=1) (ELSE=0) INTO propertycrime.
EXECUTE.

RECODE q1c ('yes'=1) (ELSE=0) INTO drugcrimes.
EXECUTE.

RECODE q1d ('yes'=1) (ELSE=0) INTO organizedcrimes.
EXECUTE.

RECODE q1e ('yes'=1) (ELSE=0) INTO politicalcrime.
EXECUTE.

RECODE q1f ('yes'=1) (ELSE=0) INTO victimlesscrime.
EXECUTE.

RECODE q1g ('yes'=1) (ELSE=0) INTO whitecollarcrime.
EXECUTE.



USE ALL.
COMPUTE filter_$=(remcode1 = 0 OR remcode1 =1 AND remcode2 = 0 OR remcode2 =1).
VARIABLE LABELS filter_$ 'remcode1 = 0 AND remcode2 = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.
