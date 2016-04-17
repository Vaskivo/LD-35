return {
  size = { w = 17, h = 11 },
  cells = {
    {0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0},
    {1,1,1,0,0,0,0,0,1,0,0,0,0,0,1,1,1},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    {1,1,1,0,0,0,0,0,1,0,0,0,0,0,1,1,1},
    {0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0},
  },
  start_position = { x = 9, y = 10 },
  start_shape = 'triangle',
  enemies = {
      { shape = 'triangle',
        position = { x = 6, y = 7 }
      },
      { shape = 'triangle',
        position = { x = 2, y = 7 }
      },
      { shape = 'square',
        position = { x = 12, y = 7 }
      },
      { shape = 'pentagon',
        position = { x = 16, y = 7 }
      },
      { shape = 'circle',
        position = { x = 9, y = 5 }
      },
      { shape = 'circle',
        position = { x = 9, y = 2 }
      },
    },
  intermission = {
    background = 'shape_triangle.png',
    s_color = {96/256, 122/256, 143/256, 0},
    o_color = {191/256, 44/256, 172/256, 0},
    dialog = {
      "<other>Hey Shape.</>",
      "<other>Do you thing love can take <big>shape</> on the battlefield?</>",
      "<shape>What are you talking about?</>",
      "<other>You see, there's this girl...</>",
      "<shape>Why are you talking to me about this?</>",
      "<shape>I'm about to end you all.</>",
      "<other>Well, I just thought...</>",
      "<shape>Just leave me alone.</>",
      "<other>That's is. Now I'm mad.</>",
      "<other>You're toast Shape!</>",
      "<other>You're toast and you don't even know it!</>"
    }
  }  
}