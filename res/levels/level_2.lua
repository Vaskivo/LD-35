return {
  size = { w = 22, h = 11 },
  cells = {
    {0,0,0,0,0,0,0,0,0,0,1,1,1,0},
    {0,0,0,0,0,0,0,0,0,0,1,1,1,0},
    {0,0,0,0,0,0,0,0,0,0,1,1,1,0},
    {0,0,0,0,0,0,0,0,0,0,0,1,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,1,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,1,0,0},
    {0,0,0,0,0,0,0,0,0,1,1,1,1,1},
    {1,1,1,0,0,0,0,0,0,1,1,1,1,1},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    {1,1,1,0,0,0,0,0,0,1,1,1,1,1},
    {0,0,0,0,0,0,0,0,0,1,1,1,1,1},
  },
  start_position = { x = 2, y = 3 },
  start_shape = 'triangle',
  enemies = {
      { shape = 'square',
        position = { x = 7, y = 3 }
      },
      { shape = 'pentagon',
        position = { x = 12, y = 3 }
      },
      { shape = 'triangle',
        position = { x = 12, y = 7 }
      },
      { shape = 'square',
        position = { x = 12, y = 10 }
      },
    },
  intermission = {
    background = 'shape_circle.png',
    s_color = {96/256, 122/256, 143/256, 0},
    o_color = {237/256, 217/256, 0/256, 0},
    dialog = {
      "<other>What are you doing here Shape?</>",
      "<shape>That's none of your business.</>",
      "<other>You're old Shape.</>",
      "<other>This is gonna be the end of you.</>",
      "<other>You're in no <big>shape</> to be playing cowboy.</>",
      "<shape>We'll see about that.</>",
      "<other>Come, Shape. Come and play.</>",
      "<other>Heeee hehehehehehe...</>"
      }
  }
}