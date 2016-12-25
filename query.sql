CREATE TABLE `cafe_board_post_detail` (
	`postNo` BIGINT(20) NULL DEFAULT NULL,
	`type` INT(11) NULL DEFAULT NULL,
	`content` TEXT NULL,
	`imageNo` BIGINT(20) NULL DEFAULT NULL,
	`seq` INT(11) NULL DEFAULT NULL,
	INDEX `postNo` (`postNo`),
	INDEX `type` (`type`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


insert into cafe_image(imageName, url1, createdDate)
values ('게시판글이미지','https://s.pstatic.net/mimgnews/image/upload/item/2016/12/22/115647760_Untitled-7.jpg?type=f270_166', NOW())

insert into cafe_image(imageName, url1, createdDate)
values ('게시판글이미지','https://s.pstatic.net/mimgnews/image/upload/item/2016/12/22/114239430_Untitled-6.jpg?type=f270_166', NOW())

insert into cafe_image(imageName, url1, createdDate)
values ('게시판글이미지','https://s.pstatic.net/mimgnews/image/upload/item/2016/12/22/103230622_249.jpg?type=f270_166', NOW())

insert into cafe_image(imageName, url1, createdDate)
values ('게시판글이미지','https://s.pstatic.net/mimgnews/image/upload/item/2016/12/21/113801236_%25C0%25CC%25B5%25BF%25BF%25ED3.jpg?type=nf288_220', NOW())



insert into cafe_board_post_detail(postNo, type, imageNo, seq )
values( 1, 2, 3, 1 )

insert into cafe_board_post_detail(postNo, type, imageNo, seq )
values( 1, 2, 4, 2 )

insert into cafe_board_post_detail(postNo, type, imageNo, seq )
values( 2, 2, 5, 1 )


insert into cafe_board_post_detail(postNo, type, imageNo, seq )
values( 3, 2, 3, 1 )

insert into cafe_board_post_detail(postNo, type, imageNo, seq )
values( 4, 2, 3, 1 )

insert into cafe_board_post_detail(postNo, type, imageNo, seq )
values( 5, 2, 3, 1 )

insert into cafe_board_post_detail(postNo, type, imageNo, seq )
values( 6, 2, 3, 1 )


insert into cafe_board_post_master(title, boardNo, userID, readCount, replyCount, noticeYN, createdDate)
values('초아초아초아 초아초아용~', 2, 'user27', 3, 0, 'N', NOW());

insert into cafe_board_post_master(title, boardNo, userID, readCount, replyCount, noticeYN, createdDate)
values('2초아초아초아 초아초아용~', 2, 'user27', 3, 0, 'N', NOW());

insert into cafe_board_post_master(title, boardNo, userID, readCount, replyCount, noticeYN, createdDate)
values('3초아초아초아 초아초아용~', 2, 'user27', 3, 0, 'N', NOW());

insert into cafe_board_post_master(title, boardNo, userID, readCount, replyCount, noticeYN, createdDate)
values('5초아초아초아 초아초아용~', 2, 'user27', 3, 0, 'N', NOW());