
    # macro input
    #> $(Motion_x)
    #> $(Motion_y)
    #> $(Motion_z)
    #> $(Rotation_y)

    $summon armadillo ~ ~ ~ { \
        Motion: [ $(Motion_x)d, $(Motion_y)d, $(Motion_z)d ], \
        Rotation: [ $(Rotation_y)f, 0f ] \
    }