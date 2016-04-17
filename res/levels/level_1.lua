return {
  size = { w = 8, h = 11 },
  cells = {
    {1,1,1,0,1,1,0,1},
    {1,1,1,0,1,1,0,1},
    {1,1,1,0,1,1,0,1},
    {0,1,0,0,1,1,0,1},
    {0,1,0,0,1,1,0,1},
    {0,1,0,0,1,1,0,1},
    {0,1,1,1,1,1,1,1},
    {0,0,0,0,1,1,0,0},
    {0,0,0,0,1,1,0,0},
    {0,0,0,0,1,1,0,0},
    {0,0,0,0,1,1,0,0},
  },
  start_position = { x = 6, y = 3 },
  start_shape = 'triangle',
  enemies = {
      { shape = 'triangle',
        position = { x = 2, y = 7 }
      },
      { shape = 'circle',
        position = { x = 8, y = 10 }
      },
      { shape = 'square',
        position = { x = 2, y = 10 }
      },
    },
  intermission = {
    background = 'shape_col.png',
    s_color = {96/256, 122/256, 143/256, 0},
    o_color = {8/256, 150/256, 28/256, 0},
    dialog = {
      "<shape>This is Shape.</>",
      "<other>Good, you arrived at your destination.</>",
      "<other>Do you remember your assignment?</>",
      "<shape>Yeah. Terrorists infiltrated a military facility.</>",
      "<shape>They plan to lauch a nuke and dominate the world.</>",
      "<other>This a one-man mission to inflitrate and kill all terrorists.</>",
      "<other>However, this is <big>shaping</> up to be a tricky mission.</>",
      "<shape>How so?</>",
      "<other>The terrorist were injected with special nanomachines that change their body.</>",
      "<shape>How do I take care of that?</>",
      "<other>You can steal their modifications for yourself, changing your body.</>",
      "<shape>Huh! That is handy.</>",
      "<other>There is only one caveat.</>",
      "<other>You can only kill enemies with one less or one more side that you have.</>",
      "<other>So if are a square, you can only kill triangles and pentagons.</>",
      "<shape>Thats a bummer.</>",
      "<other>And remember you become the <big>shape</> of the enemy you killed.</>",
      "<other>So remember the order:</>",
      "<other>Circle, triangle, square, pentagon and hexagon.</>",
      "<shape>Ok, got it.</>",
      "<other>One more time:</>",
      "<other>Circle, triangle, square, pentagon and hexagon.</>",
      "<shape>Yeah, yeah. I got it.</>",
      "<other>Ok, Shape. Carry on with the mission.</>",
      "<other>And good luck.</>",
      "<shape>Thanks."
      }
  },
  
}