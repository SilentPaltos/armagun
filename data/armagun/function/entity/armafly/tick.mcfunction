
    # Трансформация в нужную сущность
    execute \
        as @e[ predicate = armagun:entity/armafly/untransformed ] \
        positioned as @s \
    run \
        function armagun:entity/armafly/transform_untransformed