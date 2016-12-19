CREATE TABLE `cafe_detail` (
	`cafeNo` INT(11) NULL DEFAULT NULL,
	`iconImageNo` BIGINT(20) NULL DEFAULT NULL,
	`mainImageNo` BIGINT(20) NULL DEFAULT NULL,
	`mainDesc` TEXT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

insert into cafe_board_post_detail
values(1, '만남의 시간을 가지려고 하였지만 회원들의 개인사정으로 무기한 연기합니다. 개인적으로 코트에 나와서 운동하세요. 이목사님과 구성모씨 은빛님은 다음주중에 호출하면 늦은시간에라도 나오세요.');



insert into cafe_board_post_reply(postNo, userID, content, createdDate)
values(1, 'user801', '잘 하셨어요. 계속 성원과 관심 주시고 항상 체력관리 잘 하셔서 만나면 게임 한번 하시죠. ㅎㅎ', NOW());

insert into cafe_board_post_reply(postNo, userID, content, createdDate)
values(1, 'user638', '네. 자주 방문하겠습니다.', NOW());