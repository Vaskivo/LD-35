return {
  size = { w = 22, h = 11 },
  cells = {
    {0,0,0,1,0,0,0,0,0,0,0,0},
    {0,0,0,1,0,0,0,1,0,0,0,1},
    {0,0,0,1,0,0,0,1,0,0,0,1},
    {0,0,0,1,0,0,0,1,1,1,1,1},
    {1,1,1,1,0,0,0,1,0,0,0,1},
    {0,0,0,1,0,0,0,1,0,0,0,1},
    {0,0,0,1,1,1,1,1,0,0,0,1},
    {0,0,0,0,0,1,0,0,0,0,0,1},
    {0,0,0,0,1,1,1,0,1,1,1,1},
    {0,0,0,0,1,1,1,0,0,0,0,1},
    {0,0,0,0,1,1,1,0,0,0,0,1},
  },
  start_position = { x = 6, y = 2 },
  start_shape = 'triangle',
  enemies = {
      { shape = 'square',
        position = { x = 6, y = 5 }
      },
      { shape = 'triangle',
        position = { x = 4, y = 7 }
      },
      { shape = 'triangle',
        position = { x = 2, y = 7 }
      },
      { shape = 'square',
        position = { x = 4, y = 10 }
      },
      { shape = 'circle',
        position = { x = 8, y = 8 }
      },
      { shape = 'pentagon',
        position = { x = 12, y = 8 }
      },
      { shape = 'triangle',
        position = { x = 12, y = 10 }
      },
      { shape = 'square',
        position = { x = 12, y = 3 }
      },
      { shape = 'circle',
        position = { x = 9, y = 3 }
      },
    },
  intermission = {
    background = 'shape_pentagon.png',
    s_color = {96/256, 122/256, 143/256, 0},
    o_color = {179/256, 65/256, 232/256, 0},
    dialog = {
      "<other>I can see, Shape.</>",
      "<shape>Why don't you leave me alone?</>",
      "<other>I can see into your soul.</>",
      "<other>I see... I see you like to smoke</>",
      "<shape>Yeah, and?</>",
      "<other>It's bad for you.</>",
      "<other>And if you overexert yourself, you might end up in bad <big>shape</>.</>",
      "<shape>I'm going to start ignoring you now.</>",
      "<other>It's no use.</>",
      "<other>I can see us meeting in the future.</>",
      "<shape>...</>",
      "<other>See you soon, Shape.</>",
      "<other>See. You. Soon.</>"
    }
  }  
}