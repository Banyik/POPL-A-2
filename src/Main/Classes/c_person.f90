MODULE C_PERSON

    USE I_PERSON
    IMPLICIT NONE
    PRIVATE
    PUBLIC :: MAN, GET_PERSON_NAME, GET_PERSON_AGE, GET_PERSON_GENDER

    TYPE, EXTENDS(PERSON) :: MAN
        CONTAINS
            PROCEDURE :: GET_PERSON_NAME
            PROCEDURE :: GET_PERSON_AGE
            PROCEDURE :: GET_PERSON_GENDER
    END TYPE MAN

    CONTAINS

        SUBROUTINE GET_PERSON_NAME(THIS, N)
            CLASS(MAN), INTENT(IN) :: THIS
            CHARACTER (LEN = :), INTENT(OUT), ALLOCATABLE :: N
            N = THIS%NAME
        END SUBROUTINE GET_PERSON_NAME

        SUBROUTINE GET_PERSON_AGE(THIS, A)
            CLASS(MAN), INTENT(IN) :: THIS
            INTEGER, INTENT(OUT) :: A
            A = THIS%AGE
        END SUBROUTINE GET_PERSON_AGE

        SUBROUTINE GET_PERSON_GENDER(THIS, G)
            CLASS(MAN), INTENT(IN) :: THIS
            CHARACTER (LEN = :), INTENT(OUT), ALLOCATABLE :: G
            G = "MALE"
        END SUBROUTINE

END MODULE C_PERSON