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
	public List<HashMap> getFavCafeListByRegion( HashMap param )
	{
		int startIndex = 0;
		if ( !Util.isEmptyString(param.get("startIndex")))
			startIndex = Integer.parseInt(param.get("startIndex").toString());
		
		int showCount = 10;
		if ( !Util.isEmptyString(param.get("showCount")))
			showCount = Integer.parseInt(param.get("showCount").toString());
		
		param.put("startIndex", startIndex);
		param.put("showCount", showCount);
		
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getFavCafeListByRegion", param);
		return myCafeList;
	}
	
	public int getFavCafeCountByRegion( HashMap param )
	{
		return sqlSession.selectOne("com.tessoft.nearhere.cafe.getFavCafeCountByRegion", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getPopularCafeList( HashMap param )
	{
		int startIndex = 0;
		if ( !Util.isEmptyString(param.get("startIndex")))
			startIndex = Integer.parseInt(param.get("startIndex").toString());
		
		int showCount = 10;
		if ( !Util.isEmptyString(param.get("showCount")))
			showCount = Integer.parseInt(param.get("showCount").toString());
		
		param.put("startIndex", startIndex);
		param.put("showCount", showCount);
		
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getPopularCafeList", param);
		return myCafeList;
	}
	
	public int getPopularCafeListCount()
	{
		return sqlSession.selectOne("com.tessoft.nearhere.cafe.getPopularCafeListCount");
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getMyCafeList( HashMap param )
	{
		int startIndex = 0;
		if ( !Util.isEmptyString(param.get("startIndex")))
			startIndex = Integer.parseInt(param.get("startIndex").toString());
		
		int showCount = 10;
		if ( !Util.isEmptyString(param.get("showCount")))
			showCount = Integer.parseInt(param.get("showCount").toString());
		
		param.put("startIndex", startIndex);
		param.put("showCount", showCount);
		
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getMyCafeList", param);
		return myCafeList;
	}
	
	public int getMyCafeListCount( String userID )
	{
		return sqlSession.selectOne("com.tessoft.nearhere.cafe.getMyCafeListCount", userID);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<HashMap> getMyPublicMeetingList( HashMap param )
	{
		int startIndex = 0;
		if ( !Util.isEmptyString(param.get("startIndex")))
			startIndex = Integer.parseInt(param.get("startIndex").toString());
		
		int showCount = 10;
		if ( !Util.isEmptyString(param.get("showCount")))
			showCount = Integer.parseInt(param.get("showCount").toString());
		
		param.put("startIndex", startIndex);
		param.put("showCount", showCount);
		
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getMyPublicMeetingList", param);
		return myCafeList;
	}
	
	public int getMyPublicMeetingListCount( String userID )
	{
		return sqlSession.selectOne("com.tessoft.nearhere.cafe.getMyPublicMeetingListCount", userID );
	}
	
	@SuppressWarnings("rawtypes")
	public List<HashMap> getPopularPublicMeetingList( HashMap param )
	{
		int startIndex = 0;
		if ( !Util.isEmptyString(param.get("startIndex")))
			startIndex = Integer.parseInt(param.get("startIndex").toString());
		
		int showCount = 10;
		if ( !Util.isEmptyString(param.get("showCount")))
			showCount = Integer.parseInt(param.get("showCount").toString());
		
		param.put("startIndex", startIndex);
		param.put("showCount", showCount);
		
		List<HashMap> myCafeList = sqlSession.selectList("com.tessoft.nearhere.cafe.getPopularPublicMeetingList", param );
		return myCafeList;
	}
	
	public int getPopularPublicMeetingListCount()
	{
		return sqlSession.selectOne("com.tessoft.nearhere.cafe.getPopularPublicMeetingListCount");
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
		
		sqlSession.insert("com.tessoft.nearhere.cafe.insertCafeDetail", param);
		
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
	public List<HashMap> getCafeMemberListForManage(HashMap param)
	{
		int startIndex = 0;
		if ( !Util.isEmptyString(param.get("startIndex")))
			startIndex = Integer.parseInt(param.get("startIndex").toString());
		
		int showCount = 10;
		if ( !Util.isEmptyString(param.get("showCount")))
			showCount = Integer.parseInt(param.get("showCount").toString());
		
		param.put("startIndex", startIndex);
		param.put("showCount", showCount);
		
		List<HashMap> cafeMemberList = sqlSession.selectList("com.tessoft.nearhere.cafe.getCafeMemberListForManage", param);
		return cafeMemberList;
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
			
			if ( "Y".equals( memberYN ) && "운영자".equals( memberType ) ) return true;
		}
		
		return false;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public boolean isCafeOwner( String cafeID, String userToken ) throws Exception
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
		}
		
		return false;
	}

	@SuppressWarnings("rawtypes")
	public int updateCafeMemberType(HashMap param)
	{
		if ( Util.isEmptyForKey(param, "cafeID") || 
			Util.isEmptyForKey(param, "userID") ||
			Util.isEmptyForKey(param, "memberType") ) return -1;
		
		if ( "1".equals( param.get("memberType") ) )
			param.put("memberType", "운영자");
		else
			param.put("memberType", "회원");
		
		return sqlSession.update("com.tessoft.nearhere.cafe.updateCafeMemberType", param);
	}
	
	@SuppressWarnings("rawtypes")
	public int updateCafeAsDeleted(HashMap param)
	{
		if ( Util.isEmptyForKey(param, "cafeID") || 
			Util.isEmptyForKey(param, "userID") ) return -1;
		
		return sqlSession.update("com.tessoft.nearhere.cafe.updateMemberAsDeleted", param);
	}
	
	@SuppressWarnings("rawtypes")
	public int updateCafeInfo(HashMap param) throws Exception
	{
		if ( Util.isEmptyForKey(param, "cafeID") ) return -1;
		
		int result = sqlSession.update("com.tessoft.nearhere.cafe.updateCafeMasterInfo", param);
		
		if ( !Util.isEmptyForKey( param, "cafeLocation") && param.get("cafeLocation") != null )
		{
			HashMap locationInfo = (HashMap) param.get("cafeLocation");
			
			if ( !Util.isEmptyForKey(locationInfo, "latitude") && !Util.isEmptyForKey(locationInfo, "longitude") )
			{
				String fullAddress = Util.getFullAddress(Util.getStringFromHash(locationInfo, "latitude"), Util.getStringFromHash(locationInfo, "longitude"));
				HashMap regionInfo = getRegionInfo(fullAddress);
				HashMap theRegion = (HashMap) regionInfo.get("region");
				locationInfo.put("regionNo", theRegion.get("regionNo") );
			}
			
			long locationNo = 0;
			
			if ( Util.isEmptyForKey( locationInfo, "locationNo") )
			{
				insertCafeLocation(locationInfo);
				locationNo = Long.parseLong( locationInfo.get("locationNo").toString() );
				param.put("locationNo", locationNo );
			}
			else
			{
				param.put("locationNo", locationInfo.get("locationNo") );
				updateCafeLocation(locationInfo);
			}
		}
		
		result += sqlSession.update("com.tessoft.nearhere.cafe.updateCafeDetailInfo", param);
		
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int updateCafePublishYN(HashMap param)
	{
		if ( Util.isEmptyForKey(param, "cafeID") ) return -1;
		if ( Util.isEmptyForKey(param, "publishYN") ) return -1;
		
		int result = sqlSession.update("com.tessoft.nearhere.cafe.updateCafePublishYN", param);
		
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int deleteCafe(HashMap param)
	{
		if ( Util.isEmptyForKey(param, "cafeID") ) return -1;
		
		int result = sqlSession.delete("com.tessoft.nearhere.cafe.board.deleteCafeBoardAllPostReplies", param);
		result = sqlSession.delete("com.tessoft.nearhere.cafe.board.deleteCafeBoardPostDetail", param);		
		result = sqlSession.delete("com.tessoft.nearhere.cafe.board.deleteCafeBoardAllPosts", param);
		result = sqlSession.delete("com.tessoft.nearhere.cafe.board.deleteCafeAllBoard", param);
		result = sqlSession.delete("com.tessoft.nearhere.cafe.board.deleteCafeDetail", param);
		result = sqlSession.delete("com.tessoft.nearhere.cafe.board.deleteCafeMaster", param);
		
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int insertCafeLocation( HashMap param )
	{
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.insertCafeLocation", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int updateCafeLocation( HashMap param )
	{
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.updateCafeLocation", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int registerCafeMember( HashMap param )
	{
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.insertCafeMember", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int cancelCafeMember( HashMap param )
	{
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.deleteCafeMember", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int insertCafePublicMeeting( HashMap param ) throws Exception
	{
		handleLocation(param,  "meetingLocation");
		
		int result = sqlSession.insert("com.tessoft.nearhere.cafe.insertCafePublicMeeting", param);
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	public int updateCafePublicMeeting( HashMap param ) throws Exception
	{
		handleLocation(param, "meetingLocation");
		
		int result = sqlSession.update("com.tessoft.nearhere.cafe.updateCafePublicMeeting", param);
		return result;
	}

	public void handleLocation(HashMap param, String locationName) throws Exception {
		
		if ( !Util.isEmptyForKey( param, locationName ) && param.get( locationName ) != null )
		{
			HashMap locationInfo = (HashMap) param.get( locationName );
			
			if ( !Util.isEmptyForKey(locationInfo, "latitude") && !Util.isEmptyForKey(locationInfo, "longitude") )
			{
				String fullAddress = Util.getFullAddress(Util.getStringFromHash(locationInfo, "latitude"), Util.getStringFromHash(locationInfo, "longitude"));
				HashMap regionInfo = getRegionInfo(fullAddress);
				HashMap theRegion = (HashMap) regionInfo.get("region");
				locationInfo.put("regionNo", theRegion.get("regionNo") );
			}
			
			long locationNo = 0;
			
			if ( Util.isEmptyForKey( locationInfo, "locationNo") )
			{
				insertCafeLocation(locationInfo);
				locationNo = Long.parseLong( locationInfo.get("locationNo").toString() );
				param.put("locationNo", locationNo );
			}
			else
			{
				param.put("locationNo", locationInfo.get("locationNo") );
				updateCafeLocation(locationInfo);
			}
		}
	}
	
	@SuppressWarnings("rawtypes")
	public int deleteCafePublicMeeting( HashMap param )
	{
		int result = sqlSession.delete("com.tessoft.nearhere.cafe.deleteCafePublicMeeting", param);
		return result;
	}
}
