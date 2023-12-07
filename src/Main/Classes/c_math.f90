MODULE C_MATH
    USE C_EXCEPTION
    IMPLICIT NONE

    INTERFACE ADD
        MODULE PROCEDURE ADD_INT, ADD_REAL
    END INTERFACE ADD

    INTERFACE DIV
        MODULE PROCEDURE DIVIDE
    END INTERFACE DIV

    CONTAINS
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

END MODULE C_MATH