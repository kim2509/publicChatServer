package com.tessoft.nearhere;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardConroller extends BaseController {

	@RequestMapping( value ="/board/{boardNo}")
	public ModelAndView boardHome ( @PathVariable(value="boardNo") String boardNo , String userID, ModelMap model ) throws IOException
	{
		try
		{
			
		}
		catch( Exception ex )
		{
			logger.error( ex );
		}
		
		insertHistory("/board/" + boardNo, userID , null , null, null );
		
		return new ModelAndView("board/boardHome", model);
	}

}
