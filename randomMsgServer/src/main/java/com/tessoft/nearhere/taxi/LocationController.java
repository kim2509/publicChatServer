package com.tessoft.nearhere.taxi;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dy.common.ErrorCode;
import com.dy.common.Util;
import com.nearhere.domain.APIResponse;
import com.nearhere.domain.UserLocation;

@Controller
public class LocationController extends BaseController{
	
	@RequestMapping( value ="/location/getNewLocation.do")
	public @ResponseBody APIResponse getNewLocation( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		HashMap resultHash = new HashMap();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			String userID = null; 
			if ( hash.containsKey("userID") && hash.get("userID") != null )
			{
				userID = hash.get("userID").toString();
				Date date = new Date();
				String hashString = Util.getShaHashString( String.valueOf( date.getTime() ) + userID );
				
				hash.put("locationID", hashString);
				
				int result = sqlSession.insert("com.tessoft.nearhere.location.insertLocation", hash );
				
				resultHash.put("dbResult", String.valueOf(result) );
				resultHash.put("locationID", hashString);
				
				response.setData( resultHash);
			}
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
		}
		
		return response;
	}
	
	@RequestMapping( value ="/location/finishLocationTracking.do")
	public @ResponseBody APIResponse finishLocationTracking( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		HashMap resultHash = new HashMap();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			String locationID = null; 
			if ( hash.containsKey("locationID") && hash.get("locationID") != null )
			{
				locationID = hash.get("locationID").toString();
				hash.put("locationID", locationID);
				
				int result = sqlSession.update("com.tessoft.nearhere.location.updateLocationTrackingAsFinished", hash );
				
				resultHash.put("dbResult", String.valueOf(result) );
				
				response.setData( resultHash);
			}
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
		}
		
		return response;
	}
	
	
	@RequestMapping( value ="/location/insertLocationDetail.do")
	public @ResponseBody APIResponse insertLocationDetail( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		HashMap resultHash = new HashMap();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});

			if ( hash.containsKey("locationID") && hash.containsKey("latitude") && hash.containsKey("longitude") )
			{
				int result = sqlSession.insert("com.tessoft.nearhere.location.insertLocationDetail", hash );
			}
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
		}
		
		return response;
	}
	
	@RequestMapping( value ="/ul.do")
	public ModelAndView userLocation( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		String locationID = request.getParameter("ID");
		HashMap hash = new HashMap();
		hash.put("locationID", locationID);
		
		HashMap locationInfo = sqlSession.selectOne("com.tessoft.nearhere.location.getLocationInfo", hash );
		
		if ( locationInfo == null || Util.isEmptyString(locationInfo.get("locationID")))
			return new ModelAndView("location/location_error", "location", locationInfo);
		else
			return new ModelAndView("location/location", "location", locationInfo);
	}
	
	@RequestMapping( value ="/location/getLocationData.do")
	public @ResponseBody APIResponse getLocationData( HttpServletRequest request, ModelMap model, @RequestBody String bodyString )
	{
		APIResponse response = new APIResponse();
		HashMap resultHash = new HashMap();
		
		try
		{
			String logIdentifier = requestLogging(request, bodyString);
			
			HashMap hash = mapper.readValue(bodyString, new TypeReference<HashMap>(){});
			
			if ( hash == null || Util.isEmptyString(hash.get("locationID")))
			{
				response.setResCode( ErrorCode.INVALID_INPUT );
				response.setResMsg("입력값이 유효하지 않습니다.");
			}
			else
			{
				HashMap locationInfo = sqlSession.selectOne("com.tessoft.nearhere.location.getLocationInfo", hash );

				if ( locationInfo == null || Util.isEmptyString(locationInfo.get("locationID")))
				{
					response.setResCode( ErrorCode.LOCATION_EXPIRED );
					response.setResMsg("LOCATION_ID 가 유효하지 않습니다.");
				}
				else
				{
					String userID = null; 
					if ( hash.containsKey("userID") && hash.get("userID") != null )
					{
						HashMap curLocation = sqlSession.selectOne("com.tessoft.nearhere.location.selectUserCurLocation", hash);
						response.setData( curLocation);
					}
				}	
			}
			
			logger.info( "RESPONSE[" + logIdentifier + "]: " + mapper.writeValueAsString(response) );
		}
		catch( Exception ex )
		{
			response.setResCode( ErrorCode.UNKNOWN_ERROR );
			response.setResMsg(ex.getMessage());
		}
		
		return response;
	}
}
