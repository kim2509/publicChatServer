CREATE TABLE `cafe_detail` (
	`cafeNo` INT(11) NULL DEFAULT NULL,
	`iconImageNo` BIGINT(20) NULL DEFAULT NULL,
	`mainImageNo` BIGINT(20) NULL DEFAULT NULL,
	`mainDesc` TEXT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

insert into cafe_board_master(boardName, cafeNo, createdDate)
values('공지사항', 1, NOW());

insert into cafe_board_master(boardName, cafeNo, createdDate)
values('휴대폰/악세사리', 1, NOW());

insert into cafe_board_master(boardName, cafeNo, createdDate)
values('가전/가구', 1, NOW());

insert into cafe_board_master(boardName, cafeNo, createdDate)
values('문의게시판', 1, NOW());


insert into cafe_board_post_master( title, boardNo, userID, readCount, replyCount, noticeYN, createdDate)
values('그네는 너무 뻔뻔하다. 어찌 그 자리에 계속 있을 생각을 할까?', 1, 'user27', 36319, 35, 'Y', NOW() );

insert into cafe_board_post_master( title, boardNo, userID, readCount, replyCount, noticeYN, createdDate)
values('후후 하루만에 완성해부렀고마. 점점 늘어만 가는 퍼블리싱', 1, 'user27', 36319, 5, 'N', NOW() );
