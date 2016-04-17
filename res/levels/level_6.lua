return {
  size = { w = 9, h = 11 },
  cells = {
    {0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1},
    {1,0,0,0,1,0,0,0,1},
    {1,0,1,1,1,1,1,0,1},
    {1,0,1,0,1,0,1,0,1},
    {1,1,1,1,1,1,1,1,1},
    {1,0,1,0,1,0,1,0,1},
    {1,0,1,1,1,1,1,0,1},
    {1,0,0,0,1,0,0,0,1},
    {1,1,1,1,1,1,1,1,1},
    {0,0,0,0,0,0,0,0,0},
  },
  start_position = { x = 5, y = 6 },
  start_shape = 'triangle',
  enemies = {
      { shape = 'hexagon',
        position = { x = 3, y = 6 }
      },
      { shape = 'square',
        position = { x = 7, y = 6 }
      },
      { shape = 'pentagon',
        position = { x = 3, y = 8 }
      },
      { shape = 'circle',
        position = { x = 5, y = 4 }
      },
      { shape = 'pentagon',
        position = { x = 7, y = 4 }
      },
      { shape = 'circle',
        position = { x = 1, y = 10 }
      },
      { shape = 'triangle',
        position = { x = 5, y = 10 }
      },
      { shape = 'circle',
        position = { x = 9, y = 10 }
      },
      { shape = 'triangle',
        position = { x = 9, y = 6 }
      },
      { shape = 'triangle',
        position = { x = 1, y = 2 }
      },
      { shape = 'square',
        position = { x = 5, y = 2 }
      },
      { shape = 'triangle',
        position = { x = 9, y = 2 }
      },
    },
  intermission = {
    background = 'shape_hexagon.png',
    s_color = {96/256, 122/256, 143/256, 0},
    o_color = {212/256, 8/256, 8/256, 0},
    dialog = {
      "<other>Your lack of vision is disturbing, Shape.</>",
      "<other>Don't you see what we're trying to accomplish?</>",
      "<shape>You're trying to blow up the world like a bunch of maniacs.</>",
      "<other>That extremely shortsighted, Shape.</>",
      "<other>We're going to usher a new era!</>",
      "<other>Literally change the <big>shape</> of the world!</>",
      "<shape>And what about those who don't want to change?</>",
      "<other>They will be vanquished!</>",
      "<shape>Not if I can stop it!</>",
      "<other>Then come, Shape. Come.</>",
      "<other>I was looking for a challenge.</>"
      }
  }  
}