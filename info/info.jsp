TEXT([anio]) & TEXT([mes]) & TEXT([dia])

DATE([anio];[mes];[dia])


Otoño	 20 de Marzo
Invierno 21 de Junio
Primavera 23 de Septiembre 
Verano	22 de Diciembre 


if((([mes]=12 AND [dia] >= 22) OR ([mes]=1) OR ([mes]=2)  OR ([mes]=3 AND [dia] < 20));1;if((([mes]=3 AND [dia] > 22) OR ([mes]=1) OR ([mes]=2)  OR ([mes]=3 AND [dia] < 20));1;))

 OR(AND([mes] = 12; [dia] >= 22);  [mes]=1; [mes]=2;  AND([mes]=3;[dia]< 20)))

if( OR(AND([mes] = 12; [dia] >= 22);  [mes]=1; [mes]=2;  AND([mes]=3;[dia]< 20));1;
if( OR(AND([mes] = 3; [dia] >= 20);  [mes]=4; [mes]=5;  AND([mes]=6;[dia]< 21));2;
if( OR(AND([mes] = 6; [dia] >= 21);  [mes]=7; [mes]=8;  AND([mes]=9;[dia]< 23));3;
    4)))
