PROGRAM MAIN

    USE C_PERSON
    USE C_MATH
    !USE C_MATH_OPERATION
    USE C_EXCEPTION
    IMPLICIT NONE

    TYPE(MAN) :: P
    CHARACTER (LEN = :), ALLOCATABLE :: P_NAME
    CHARACTER (LEN = :), ALLOCATABLE :: P_GENDER
    INTEGER :: P_AGE

    REAL :: DIV_RESULT
    INTEGER :: ARRAY_I(4) = [1,6,2,7]
    REAL :: ARRAY_R(4) = [1.2, 1.3, 1.0, -0.5]
    INTEGER :: X, SUM_R, SUM_I
    INTEGER, DIMENSION(:), ALLOCATABLE :: EVENS
    REAL, DIMENSION(:), ALLOCATABLE :: POWS

    P = MAN("Someone", 5)
    CALL P%GET_PERSON_NAME(P_NAME)
    CALL P%GET_PERSON_AGE(P_AGE)
    CALL P%GET_PERSON_GENDER(P_GENDER)
    PRINT *, P_NAME, P_AGE, P_GENDER;

    

    DIV_RESULT = DIV(21.0, 0.0)
    X = FACTORIAL(3)
    SUM_I = SUM_M(ARRAY_I, SIZE(ARRAY_I))
    SUM_R = SUM_M(ARRAY_R, SIZE(ARRAY_R))
    EVENS = EVEN(ARRAY_I, SIZE(ARRAY_I))
    POWS = MAP_POW(ARRAY_R, SIZE(ARRAY_R))
    PRINT *, ADD(3,6), ADD(3.2, 2.7), DIV_RESULT, X, SUM_I, SUM_R, 'EVENS: ', EVENS, 'POWS: ', POWS

    !CALL OPERATION(12.0, 25.0, FUNC => ADD)
END PROGRAM MAIN