-- based on code from ZeroK's nuke explosion CEG code.
-- Creates a nuke like explosion.
return {
  ["bombsmoke_ring"] = {
    land = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.9,
        alwaysvisible      = true,
        colormap           = [[0 0 0 0  1 1 0.75 1  1 0.75 0.5 1  0.75 0.75 0.75 1  0 0 0 0]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 5,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.2, 0]],
        numparticles       = 128,
        particlelife       = 30,
        particlelifespread = 10,
        particlesize       = 4,
        particlesizespread = 4,
        particlespeed      = 16,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = 8,
        sizemod            = 0.5,
        texture            = [[bombsmoke]],
      },
    },
  },

  ["bombsmoke"] = {
    usedefaultexplosions = false,
    cap = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 24,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[i1]],
        dir                = [[dir]],
        explosiongenerator = [[custom:bombsmoke_cap]],
        pos                = [[0, i8, 0]],
      },
    },
    pillar = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 32,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[i1]],
        dir                = [[dir]],
        explosiongenerator = [[custom:bombsmoke_pillar]],
        pos                = [[0, i8, 0]],
      },
    },
    ring = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        delay              = 16,
        dir                = [[dir]],
        explosiongenerator = [[custom:bombsmoke_ring]],
        pos                = [[0, 128, 0]],
      },
    },
    topcap = {
      air                = true,
      class              = [[CExpGenSpawner]],
      count              = 8,
      ground             = true,
      water              = true,
      properties = {
        delay              = [[24 i1]],
        dir                = [[dir]],
        explosiongenerator = [[custom:bombsmoke_topcap]],
        pos                = [[0, 192 i8, 0]],
      },
    },
  },

  ["bombsmoke_topcap"] = {
    land = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.9,
        alwaysvisible      = true,
        colormap           = [[0 0 0 0  1 1 0 1  1 1 1 0.75  0.25 0.25 0.25 0.5  0 0 0 0]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 5,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.2, 0]],
        numparticles       = 4,
        particlelife       = 30,
        particlelifespread = 10,
        particlesize       = 4,
        particlesizespread = 4,
        particlespeed      = 4,
        particlespeedspread = 4,
        pos                = [[0, 0, 0]],
        sizegrowth         = 16,
        sizemod            = 0.75,
        texture            = [[fireball]],
      },
    },
  },

  ["bombsmoke_cap"] = {
    land = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.9,
        alwaysvisible      = true,
        colormap           = [[0 0 0 0  1 1 0 1  1 1 1 0.75  0.25 0.25 0.25 0.5  0 0 0 0]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 5,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.2, 0]],
        numparticles       = 4,
        particlelife       = 15,
        particlelifespread = 5,
        particlesize       = 4,
        particlesizespread = 4,
        particlespeed      = 4,
        particlespeedspread = 4,
        pos                = [[0, 0, 0]],
        sizegrowth         = 16,
        sizemod            = 0.75,
        texture            = [[fireball]],
      },
    },
  },

  ["bombsmoke_pillar"] = {
    land = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
        airdrag            = 0.9,
        alwaysvisible      = true,
        colormap           = [[0 0 0 0  1 1 0.5 1  1 0.75 0.5 0.75  0.25 0.25 0.25 0.5  0 0 0 0]],
        directional        = false,
        emitrot            = 0,
        emitrotspread      = 90,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.2, 0]],
        numparticles       = 1,
        particlelife       = 30,
        particlelifespread = 10,
        particlesize       = 4,
        particlesizespread = 4,
        particlespeed      = 1,
        particlespeedspread = 1,
        pos                = [[0, 0, 0]],
        sizegrowth         = 16,
        sizemod            = 0.75,
        texture            = [[bombsmoke]],
      },
    },
  },

}

