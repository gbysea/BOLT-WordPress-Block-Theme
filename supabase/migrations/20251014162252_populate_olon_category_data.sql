/*
  # Populate OLON Category Data from CSV

  1. Data Updates
    - Update all 6 categories with data from the CSV reference
    - Maps categories by name: TOP, UP, CHARM, BOTTOM, DOWN, STRANGE
    - Adds all CSV fields including score ranges, valence, colors, mode, direction, and playlist IDs
  
  2. Category Mappings
    - TOP: RED (#ff0000), mode=on, direction=deosil, scores 83.34-100
    - UP: YELLOW (#ffff00), mode=no, direction=widdershins, scores 66.67-83.33
    - CHARM: GREEN (#00ff00), mode=on, direction=deosil, scores 50.01-66.66
    - BOTTOM: CYAN (#00ffff), mode=no, direction=widdershins, scores 33.34-50
    - DOWN: BLUE (#0000ff), mode=on, direction=deosil, scores 16.67-33.33
    - STRANGE: MAGENTA (#ff00ff), mode=no, direction=widdershins, scores 0-16.66
*/

-- Update TOP category
UPDATE categories
SET 
  csv_id = 1,
  min_score = 83.34,
  max_score = 100.00,
  min_valence = 0.84,
  max_valence = 1.00,
  color_hex = '#ff0000',
  mode = 'on',
  direction = 'deosil',
  spotify_playlist_id = '1bFGxK2W22DOZPu1ctBe4e',
  youtube_playlist_id = 'PLgnjd2RM1yykw7xp1XLUJHhuye2ibQr_R'
WHERE slug = 'top';

-- Update UP category
UPDATE categories
SET 
  csv_id = 2,
  min_score = 66.67,
  max_score = 83.33,
  min_valence = 0.67,
  max_valence = 0.83,
  color_hex = '#ffff00',
  mode = 'no',
  direction = 'widdershins',
  spotify_playlist_id = '4gDVc4fp0uuPct3XB7x2fP',
  youtube_playlist_id = 'PLgnjd2RM1yykxzw2KccoCL-h2qRWxtBX_'
WHERE slug = 'up';

-- Update CHARM category
UPDATE categories
SET 
  csv_id = 3,
  min_score = 50.01,
  max_score = 66.66,
  min_valence = 0.51,
  max_valence = 0.66,
  color_hex = '#00ff00',
  mode = 'on',
  direction = 'deosil',
  spotify_playlist_id = '46WOf2CzafaAeubjMDcGnL',
  youtube_playlist_id = 'PLgnjd2RM1yylzIVKxFruuoHe_JngUIcLr'
WHERE slug = 'charm';

-- Update BOTTOM category
UPDATE categories
SET 
  csv_id = 4,
  min_score = 33.34,
  max_score = 50.00,
  min_valence = 0.34,
  max_valence = 0.50,
  color_hex = '#00ffff',
  mode = 'no',
  direction = 'widdershins',
  spotify_playlist_id = '6DOWKiqLbk9r1tgoPtiSRi',
  youtube_playlist_id = 'PLgnjd2RM1yykYTdpWFFY781x8NBcyl5Fr'
WHERE slug = 'bottom';

-- Update DOWN category
UPDATE categories
SET 
  csv_id = 5,
  min_score = 16.67,
  max_score = 33.33,
  min_valence = 0.17,
  max_valence = 0.33,
  color_hex = '#0000ff',
  mode = 'on',
  direction = 'deosil',
  spotify_playlist_id = '5YYC93yR0oDXeiwsiEraEB',
  youtube_playlist_id = 'PLgnjd2RM1yykX4Gg9dw3DDqaXQ53guV9d'
WHERE slug = 'down';

-- Update STRANGE category
UPDATE categories
SET 
  csv_id = 6,
  min_score = 0.00,
  max_score = 16.66,
  min_valence = 0.00,
  max_valence = 0.16,
  color_hex = '#ff00ff',
  mode = 'no',
  direction = 'widdershins',
  spotify_playlist_id = '5MJW2yRjyTc4Y39hHRom3Q',
  youtube_playlist_id = 'PLgnjd2RM1yykWdlWJkxxUXjA-P2_zHDWd'
WHERE slug = 'strange';