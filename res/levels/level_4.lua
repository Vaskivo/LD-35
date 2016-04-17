return {
  size = { w = 16, h = 11 },
  cells = {
    {1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    {1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1},
    {0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0},
    {0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0},
    {0,1,0,0,0,0,0,0,1,0,0,0,0,0,1,0},
    {0,1,0,0,0,0,0,0,1,0,0,0,0,0,1,0},
    {0,1,0,0,0,0,0,0,1,0,0,0,0,0,1,0},
    {1,1,1,1,0,0,0,0,1,0,0,0,0,1,1,1},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    {1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1},
  },
  start_position = { x = 9, y = 6 },
  start_shape = 'triangle',
  enemies = {
      { shape = 'square',
        position = { x = 2, y = 10 }
      },
      { shape = 'triangle',
        position = { x = 9, y = 10 }
      },
      { shape = 'triangle',
        position = { x = 15, y = 10 }
      },
      { shape = 'circle',
        position = { x = 2, y = 6 }
      },
      { shape = 'square',
        position = { x = 15, y = 6 }
      },
      { shape = 'pentagon',
        position = { x = 2, y = 2 }
      },
      { shape = 'triangle',
        position = { x = 6, y = 2 }
      },
      { shape = 'circle',
        position = { x = 12, y = 2 }
      },
      { shape = 'square',
        position = { x = 15, y = 2 }
      },
    },
  intermission = {
    background = 'shape_square.png',
    s_color = {96/256, 122/256, 143/256, 0},
    o_color = {237/256, 123/256, 0/256, 0},
    dialog = {
      "<other>SHAAAAAAPE!</>",
      "<shape>What now?</>",
      "<other>DO YOU REMEMBER SHAPE?</>",
      "<other>THE <big>SHAPE</> OF BATTLE!</>",
      "<other>THE CLASH OF EDGE AND VERTEX.</>",
      "<shape>You're a bit over excited.</>",
      "<other>LET'S BATTLE SHAPE!</>",
      "<other>BATTLE FOR THE FATE OF OUR ANCESTORS!</>",
      "<shape>Please leave.</>",
      "<other>RGGGGHHH!! *SNORT* GRAAALHSSSSSFFFF</>"
    }
  }  
}