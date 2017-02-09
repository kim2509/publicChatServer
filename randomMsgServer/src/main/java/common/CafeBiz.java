package common;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.User;

public class CafeBiz extends CommonBiz{

	private static CafeBiz cafeBiz = null;

	public static CafeBiz getInstance( SqlSession sqlSession )
	{
		if ( CafeBiz.cafeBiz == null )
			CafeBiz.cafeBiz = new CafeBiz( sqlSession );

		return CafeBiz.cafeBiz;
	}
	
	public CafeBiz( SqlSession sqlSession )
	{
		super(sqlSession);
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getMyCafeList( String userID )
	{
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getMyCafeList", userID);
		return myCafeList;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeMeetingsInMyFavRegion( String userID )
	{
		List<HashMap> meetingList = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafeMeetingsInMyFavRegion", userID);
		return meetingList;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeMeetingsByRegion( HashMap param )
	{
		int startIndex = 0;
		if ( !Util.isEmptyString(param.get("startIndex")))
			startIndex = Integer.parseInt(param.get("startIndex").toString());
		
		int showCount = 10;
		if ( !Util.isEmptyString(param.get("showCount")))
			showCount = Integer.parseInt(param.get("showCount").toString());
		
		param.put("startIndex", startIndex);
		param.put("showCount", showCount);
		
		List<HashMap> meetingList = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafeMeetingsByRegion", param);
		return meetingList;
	}
	
	@SuppressWarnings("rawtypes")
	public int getTotalCafeMeetingsCountByRegion(HashMap param)
	{
		int totalCount = sqlSession.selectOne("com.tessoft.nearhere.cafe.getTotalCafeMeetingsCountByRegion", param);
		return totalCount;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getUpcomingCafeMeetingList( String userID )
	{
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getUpcomingCafeMeetingList", userID);
		return myCafeList;
	}
	
	@SuppressWarnings("rawtypes")
	public int makeCafe( HashMap param )
	{
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.makeCafe", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap getCafeMainInfo(HashMap param)
	{
		HashMap cafeMainInfo = sqlSession.selectOne("com.tessoft.nearhere.cafe.getCafeMainInfo", param);
		return cafeMainInfo;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafePublicMeetingList(HashMap param)
	{
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafePublicMeetingList", param);
		return myCafeList;
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap getCafeMeetingInfo(HashMap param)
	{
		HashMap meetingInfo = sqlSession.selectOne("com.tessoft.nearhere.cafe.getCafeMeetingInfo", param);
		return meetingInfo;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeMeetingMembers(HashMap param)
	{
		List<HashMap> meetingMembers = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafeMeetingMembers", param);
		return meetingMembers;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeMemberList(HashMap param)
	{
		List<HashMap> cafeMemberList = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafeMemberList", param);
		return cafeMemberList;
	}
	
	@SuppressWarnings("rawtypes")
	public String getCafeMemberCount(HashMap param)
	{
		String cafeMemberCount = sqlSession.selectOne("com.tessoft.nearhere.cafe.getCafeMemberCount", param);
		return cafeMemberCount;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeBoardList(HashMap param)
	{
		List<HashMap> boardList = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafeBoardList", param);
		return boardList;
	}
	
	@SuppressWarnings("rawtypes")
	public int insertCafeBoard( HashMap param )
	{
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.insertCafeBoard", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int modifyCafeBoard( HashMap param )
	{
		int result = sqlSession.update("com.tessoft.nearhere.cafe.updateCafeBoard", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int deleteCafeBoard( HashMap param )
	{
		int result = sqlSession.delete("com.tessoft.nearhere.cafe.deleteCafeBoard", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap getCafeBoardInfo(HashMap param)
	{
		HashMap boardInfo = sqlSession.selectOne("com.tessoft.nearhere.cafe.getCafeBoardInfo", param);
		return boardInfo;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getBoardPostList(HashMap param)
	{
		List<HashMap> postList = sqlSession.selectList("com.tessoft.nearhere.cafe.getBoardPostList", param);
		return postList;
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap getCafeBoardPostInfo(HashMap param)
	{
		HashMap postInfo = sqlSession.selectOne("com.tessoft.nearhere.cafe.getCafeBoardPostInfo", param);
		return postInfo;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getCafeBoardPostContent(HashMap param)
	{
		List<HashMap> content = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafeBoardPostContent", param);
		return content;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<HashMap> getCafeBoardPostReplyList(HashMap param)
	{
		int startIndex = Integer.parseInt( param.get("startIndex").toString() );
		int showCount = Integer.parseInt( param.get("showCount").toString() );
		param.remove("startIndex");
		param.remove("showCount");
		param.put("startIndex", startIndex);
		param.put("showCount", showCount);
		
		List<HashMap> replyList = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafeBoardPostReplyList", param);
		return replyList;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<HashMap> getCafeBoardPostImageList(HashMap param)
	{
		int startIndex = Integer.parseInt( param.get("startIndex").toString() );
		int showCount = Integer.parseInt( param.get("showCount").toString() );
		param.remove("startIndex");
		param.remove("showCount");
		param.put("startIndex", startIndex);
		param.put("showCount", showCount);
		
		List<HashMap> postList = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafeBoardPostImageList", param);
		return postList;
	}
	
	@SuppressWarnings("rawtypes")
	public int getCafeBoardPostImageCount(HashMap param)
	{
		int totalCount = sqlSession.selectOne("com.tessoft.nearhere.cafe.getCafeBoardPostImageCount", param);
		return totalCount;
	}
	
	@SuppressWarnings("rawtypes")
	public int insertCafeMeeting( HashMap param )
	{
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.insertCafeMeeting", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int deleteCafeMeeting( HashMap param )
	{
		int result = sqlSession.delete("com.tessoft.nearhere.cafe.deleteCafeMeeting", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> searchCafe( HashMap param )
	{
		int startIndex = 0;
		if ( !Util.isEmptyString(param.get("startIndex")))
			startIndex = Integer.parseInt(param.get("startIndex").toString());
		
		int showCount = 10;
		if ( !Util.isEmptyString(param.get("showCount")))
			showCount = Integer.parseInt(param.get("showCount").toString());
		
		param.put("startIndex", startIndex);
		param.put("showCount", showCount);
		
		List<HashMap> meetingList = sqlSession.selectList("com.tessoft.nearhere.cafe.searchCafe", param);
		return meetingList;
	}
	
	@SuppressWarnings("rawtypes")
	public int searchCafeCount(HashMap param)
	{
		int totalCount = sqlSession.selectOne("com.tessoft.nearhere.cafe.searchCafeCount", param);
		return totalCount;
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> searchCafePosts( HashMap param )
	{
		int startIndex = 0;
		if ( !Util.isEmptyString(param.get("startIndex")))
			startIndex = Integer.parseInt(param.get("startIndex").toString());
		
		int showCount = 10;
		if ( !Util.isEmptyString(param.get("showCount")))
			showCount = Integer.parseInt(param.get("showCount").toString());
		
		param.put("startIndex", startIndex);
		param.put("showCount", showCount);
		
		List<HashMap> meetingList = sqlSession.selectList("com.tessoft.nearhere.cafe.searchCafePosts", param);
		return meetingList;
	}
	
	@SuppressWarnings("rawtypes")
	public int searchCafePostsCount(HashMap param)
	{
		int totalCount = sqlSession.selectOne("com.tessoft.nearhere.cafe.searchCafePostsCount", param);
		return totalCount;
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap getCafeUserInfo(HashMap param)
	{
		return sqlSession.selectOne("com.tessoft.nearhere.cafe.getCafeUserInfo", param);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public boolean isCafeManager( String cafeID, String userToken ) throws Exception
	{
		HashMap userInfo = UserBiz.getInstance(sqlSession).selectUserByUserToken(userToken);
		
		if ( userInfo != null )
		{
			userInfo.put("cafeID", cafeID);
			HashMap cafeUserInfo = getCafeUserInfo(userInfo);
			
			String ownerYN = "N";
			String memberYN = "N";
			String memberType = "";
			if ( cafeUserInfo != null )
			{
				ownerYN = cafeUserInfo.get("ownerYN").toString();
				memberYN = cafeUserInfo.get("memberYN").toString();
				memberType = cafeUserInfo.get("memberType").toString();
			}
			
			if ( "Y".equals( ownerYN ) ) return true;
			
			if ( "Y".equals( memberYN ) && "운영진".equals( memberType ) ) return true;
		}
		
		return false;
	}
}
