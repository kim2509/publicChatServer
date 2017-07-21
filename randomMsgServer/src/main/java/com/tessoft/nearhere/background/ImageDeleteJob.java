package com.tessoft.nearhere.background;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.dy.common.Constants;
import com.dy.common.Util;

import common.BackgroundJobBiz;

public class ImageDeleteJob {

	protected static Logger logger = Logger.getLogger(ImageDeleteJob.class.getName());

	ObjectMapper mapper = null;

	BackgroundJobBiz jobBiz = null;

	@Autowired
	private SqlSession sqlSession;

	public ImageDeleteJob() {
		// TODO Auto-generated constructor stub
		mapper = new ObjectMapper();

		logger.info( "ScheduledTasks created." );
	}

	// 임시 이미지 삭제처리 commitDate 가 null 인 애들 모두 삭제하는 Job
	@Scheduled(fixedRate = 1000 * 60 * 60 ) // 1시간마다
	public void deleteTemporaryImages() {

		try
		{
			logger.info( "deleteTemporaryImages start !!!!!!!!!!!!!!!!" );

			List<HashMap> imageList = sqlSession.selectList("com.tessoft.nearhere.cafe.background.getTemporaryImageList" );

			if ( imageList != null )
			{
				for ( int i = 0; i < imageList.size(); i++ )
				{
					String serverPath = Util.getStringFromHash( imageList.get(i), "serverPath");
					
					if ( Util.isEmptyString(serverPath)) continue;
					
					logger.info( "delete imageNo:" + Util.getStringFromHash(imageList.get(i), "imageNo") + " for " + serverPath );
					
					File file = new File( serverPath );
					
					boolean bDeleted = false;
					
					if (file.exists())
					{
						bDeleted = file.delete();
					}
								
					if ( bDeleted )
					{
						sqlSession.delete("com.tessoft.nearhere.cafe.background.deleteCafeTemporaryImage", imageList.get(i) );
					}
				}
			}
			
			logger.info( "deleteTemporaryImages ended !!!!!!!!!!!!!!!!" );
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
	}

}
