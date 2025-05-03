CREATE TABLE member (
    id SERIAL PRIMARY KEY,
    name text NOT NULL,
    full_name text NOT NULL,
    birth_date DATE NOT NULL,
    birth_city TEXT NOT NULL,
    picture TEXT NOT NULL,
    first_solo_song TEXT NOT NULL
);

INSERT INTO member (name, full_name, birth_date, birth_city, picture, first_solo_song) VALUES
('rm', 'Kim Namjoon',        '1994-09-12', 'Ilsan',    'https://live.staticflickr.com/888/28875138568_949ed55827_b.jpg',           'Do You'),
('jin', 'Kim Seokjin',       '1992-12-04', 'Gwacheon', 'https://live.staticflickr.com/4481/37524658696_4fee0f99d3_b.jpg',       'Awake'),
('suga', 'Min Yoongi',      '1993-03-09', 'Daegu',    'https://live.staticflickr.com/4460/37314591600_edd4f55dbb_h.jpg',      'The Last'),
('jhope', 'Jung Hoseok',     '1994-02-18', 'Gwangju',  'https://live.staticflickr.com/4464/23720716448_6da374087e_b.jpg',     '1 VERSE'),
('jimin', 'Park Jimin',    '1995-10-13', 'Busan',    'https://live.staticflickr.com/1841/43537358245_392394b2d0_h.jpg',                           'Lie'),
('v', 'Kim Taehyung',         '1995-12-30', 'Daegu',    'https://live.staticflickr.com/4225/34247433253_e886f2d099_z.jpg',                               'Stigma'),
('jungkook', 'Jeon Jungkook',  '1997-09-01', 'Busan',    'https://live.staticflickr.com/4484/37524678756_3b0f9db3e8_b.jpg',                        'Begin');
