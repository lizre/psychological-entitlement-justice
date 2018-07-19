
MISSING VALUES age ssvspower1 ssvspower2 ssvspower3 ssvspower4 ssvsachievement1 ssvsachievement2 ssvsachievement3 ssvsachievement4
retribjorient1 retribjorient2 retribjorient3 retribjorient4 retribjorient5 retribjorient6
crimethreat1 crimethreat2 crimethreat3 statusresmot1 statusresmot2
hient1 hient2 hient3
lowent1 lowent2 lowent3
politicalid (-999).


***Reliability of Values.

RELIABILITY
  /VARIABLES= ssvspower1 ssvspower2 ssvspower3 ssvspower4 ssvsachievement1 ssvsachievement2 ssvsachievement3 ssvsachievement4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

COMPUTE selfenhan=MEAN(ssvsachievement1, ssvsachievement2, ssvsachievement3, ssvsachievement4, ssvspower1, ssvspower2, ssvspower3, ssvspower4).
EXECUTE.



RELIABILITY
  /VARIABLES= ssvsachievement1 ssvsachievement2 ssvsachievement3 ssvsachievement4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.



RELIABILITY
  /VARIABLES= ssvspower1 ssvspower2 ssvspower3 ssvspower4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

COMPUTE power=MEAN(ssvspower1, ssvspower2, ssvspower3, ssvspower4).
EXECUTE.

COMPUTE achievement=MEAN(ssvsachievement1, ssvsachievement2, ssvsachievement3, ssvsachievement4).
EXECUTE.



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

RECODE @_3 ("lowent"=0) ("hient"=1) INTO entcond.


RECODE remove (SYSMIS=0).
EXECUTE.




USE ALL.
COMPUTE filter_$=(remove=0 and remove2=0).
VARIABLE LABELS filter_$ 'remove=0 and remove2=0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.
