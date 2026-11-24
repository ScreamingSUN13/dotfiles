' Test script for syntax highlighting
DECLARE FUNCTION Greet$ (Name$)

FOR I = 1 TO 5
    IF I MOD 2 = 0 THEN
        PRINT Greet$("World"), I
    END IF
NEXT I

FUNCTION Greet$ (Name$)
    Greet$ = "Hello, " + Name$ + "!"
END FUNCTION
