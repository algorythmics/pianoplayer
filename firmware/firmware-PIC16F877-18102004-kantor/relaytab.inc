; 5 Befehle fuer table lookup und und setport
 ; w ist index
ClearPort
    bcf   STATUS,C
    rlf   relaisnr, w  ; *2 als index nach w
ClearPort2          ; wenn index schon * 2 ist dann nur 3 befehle
    addwf PCL, f

    bsf REL0
    return

    bsf REL1
    return

    bsf REL2
    return

    bsf REL3
    return

    bsf REL4
    return

    bsf REL5
    return

    bsf REL6
    return

    bsf REL7
    return

    bsf REL8
    return

    bsf REL9
    return

    bsf REL10
    return

    bsf REL11
    return

    bsf REL12
    return

    bsf REL13
    return

    bsf REL14
    return

    bsf REL15
    return

    bsf REL16
    return

    bsf REL17
    return

    bsf REL18
    return

    bsf REL19
    return

    bsf REL20
    return

    bsf REL21
    return

    bsf REL22
    return

    bsf REL23
    return


 ; 5 Befehle fuer table lookup und und clear port
 ; w ist index

SetPort
    bcf   STATUS,C
    rlf   relaisnr, w  ; *2 als index nach w
SetPort2          ; wenn index schon * 2 ist dann nur 3 befehle
    addwf PCL, f

    bcf REL0
    return

    bcf REL1
    return

    bcf REL2
    return

    bcf REL3
    return

    bcf REL4
    return

    bcf REL5
    return

    bcf REL6
    return

    bcf REL7
    return

    bcf REL8
    return

    bcf REL9
    return

    bcf REL10
    return

    bcf REL11
    return

    bcf REL12
    return

    bcf REL13
    return

    bcf REL14
    return

    bcf REL15
    return

    bcf REL16
    return

    bcf REL17
    return

    bcf REL18
    return

    bcf REL19
    return

    bcf REL20
    return

    bcf REL21
    return

    bcf REL22
    return

    bcf REL23
    return
