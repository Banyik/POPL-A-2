MODULE C_MATH
    USE C_EXCEPTION
    IMPLICIT NONE

    INTERFACE ADD
        MODULE PROCEDURE ADD_INT, ADD_REAL
    END INTERFACE ADD

    INTERFACE SUM_M
        MODULE PROCEDURE SUM_INTEGER, SUM_REAL
    END INTERFACE SUM_M

    INTERFACE DIV
        MODULE PROCEDURE DIVIDE
    END INTERFACE DIV

    CONTAINS
        SUBROUTINE OPERATION_INT(A, B, FUNC)
            INTEGER, INTENT(IN) :: A, B
            PROCEDURE(ADD_INT), POINTER :: FUNC
            REAL :: RESULT

            RESULT = FUNC(A, B)

            PRINT *, "Result: ", RESULT

        END SUBROUTINE OPERATION_INT

        SUBROUTINE OPERATION_REAL(A, B, FUNC)
            REAL, INTENT(IN) :: A, B
            PROCEDURE(ADD_REAL), POINTER :: FUNC
            REAL :: RESULT
            RESULT = FUNC(A, B)
            PRINT *, "Result: ", RESULT
        END SUBROUTINE OPERATION_REAL

        FUNCTION ADD_INT(A, B)
            INTEGER, INTENT(IN) :: A, B
            INTEGER :: ADD_INT
            ADD_INT = A + B
        END FUNCTION ADD_INT

        FUNCTION ADD_REAL(A, B)
            REAL, INTENT(IN) :: A, B
            REAL :: ADD_REAL
            ADD_REAL = A + B
        END FUNCTION ADD_REAL

        FUNCTION DIVIDE(A, B)
            REAL, INTENT(IN) :: A, B
            REAL :: DIVIDE
            CHARACTER(LEN = :), ALLOCATABLE :: ERROR
            IF(B == 0) THEN
                ERROR = 'CANNOT DIVIDE BY ZERO!'
                CALL RAISE(ERROR)
                DIVIDE = 0
            ELSE 
            DIVIDE = A / B
            END IF

        END FUNCTION DIVIDE

        RECURSIVE FUNCTION FACTORIAL(X) RESULT(RESULT)
            INTEGER, INTENT(IN) :: X
            INTEGER :: RESULT

            IF (X <= 0) THEN
                RESULT = 1
            ELSE
                RESULT = X * FACTORIAL(X - 1)
            END IF
        END FUNCTION FACTORIAL

        FUNCTION SUM_INTEGER(ARRAY, LEN) RESULT(RESULT)
            INTEGER, INTENT(IN) :: ARRAY(:)
            INTEGER, INTENT(IN) :: LEN
            INTEGER :: RESULT, I
        
            RESULT = 0
            DO I = 1, LEN
                RESULT = RESULT + ARRAY(I)
            END DO
        END FUNCTION SUM_INTEGER

        FUNCTION SUM_REAL(ARRAY, LEN) RESULT(RESULT)
            REAL, INTENT(IN) :: ARRAY(:)
            INTEGER, INTENT(IN) :: LEN
            INTEGER :: I
            REAL :: RESULT
        
            RESULT = 0
            DO I = 1, LEN
                RESULT = RESULT + ARRAY(I)
            END DO
        END FUNCTION SUM_REAL

        FUNCTION MAP_POW(ARRAY, LEN) RESULT(RESULT)
            REAL, INTENT(IN) :: ARRAY(:)
            INTEGER, INTENT(IN) :: LEN
            INTEGER :: I
            REAL :: RESULT(LEN)
        
            RESULT = 0
            DO I = 1, LEN
                RESULT(I) = ARRAY(I)**2
            END DO
        END FUNCTION MAP_POW

        FUNCTION EVEN(ARRAY, LEN) RESULT(RESULT)
            INTEGER, INTENT(IN) :: ARRAY(:)
            INTEGER, INTENT(IN) :: LEN
            INTEGER :: I
            INTEGER, ALLOCATABLE :: RESULT(:)
        
            INTEGER :: COUNT
            COUNT = 0
            DO I = 1, LEN
                IF (MODULO(ARRAY(I), 2) == 0) THEN
                    COUNT = COUNT + 1
                END IF
            END DO
            ALLOCATE(RESULT(COUNT))
            COUNT = 0
            DO I = 1, LEN
                IF (MODULO(ARRAY(I), 2) == 0) THEN
                    COUNT = COUNT + 1
                    RESULT(count) = ARRAY(I)
                END IF
            END DO
        
        END FUNCTION EVEN

END MODULE C_MATH