insert into user_tb(username, password, email, created_at) values('ssar', '1234', 'ssar@nate.com', now());
insert into user_tb(username, password, email, created_at) values('cos', '1234', 'cos@nate.com', now());
insert into user_tb(username, password, email, created_at) values('love', '1234', 'love@nate.com', now());

insert into board_tb(user_id, title, content, thumbnail, created_at) values('1', '2pac', 'all eyes on me', '/images/2pac.jpg', now());
insert into board_tb(user_id, title, content, thumbnail, created_at) values('2', '10cm', '그라데이션', '/images/10cm.jpg', now());
insert into board_tb(user_id, title, content, thumbnail, created_at) values('3', 'Nirvana', '너바나', '/images/너바나.jpg', now());
insert into board_tb(user_id, title, content, thumbnail, created_at) values('1', 'NewJeans', 'hype boy', '/images/뉴진스.jpg', now());
insert into board_tb(user_id, title, content, thumbnail, created_at) values('2', 'Drake', 'Fashion Fruits', '/images/드레이크.jpg', now());
insert into board_tb(user_id, title, content, thumbnail, created_at) values('3', '아이브', 'After Like', '/images/아이브.png', now());
insert into board_tb(user_id, title, content, thumbnail, created_at) values('1', 'Weekend', 'I feel it comming', '/images/위켄드.jpg', now());
insert into board_tb(user_id, title, content, thumbnail, created_at) values('2', 'camo', 'Life is Wet', '/images/카모.jpg', now());

commit;