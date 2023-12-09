MODULE C_MATH_OPERATION
    USE C_EXCEPTION
    IMPLICIT NONE

    INTERFACE 
        FUNCTION OP(A, B)
            REAL, INTENT(IN) :: A, B
            REAL :: OP
        END FUNCTION OP
    END INTERFACE

    CONTAINS

        SUBROUTINE OPERATION(A, B, FUNC)
            REAL, INTENT(IN) :: A, B
            PROCEDURE(OP), POINTER :: FUNC
            REAL :: RESULT
            RESULT = FUNC(A, B)
            PRINT *, "Result: ", RESULT
        END SUBROUTINE OPERATION

        FUNCTION ADD(A, B)
            REAL, INTENT(IN) :: A, B
            REAL :: ADD
            ADD = A + B
        END FUNCTION ADD

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

END MODULE C_MATH_OPERATION
