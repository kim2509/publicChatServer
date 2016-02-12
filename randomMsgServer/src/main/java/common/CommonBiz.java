package common;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.dy.common.Constants;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

public class CommonBiz {

	protected static Logger logger = Logger.getLogger(CommonBiz.class.getName());

	protected ObjectMapper mapper = null;
	protected SqlSession sqlSession = null;
	private Sender sender = null;
	
	public CommonBiz( SqlSession sqlSession )
	{
		mapper = new ObjectMapper();
		this.sqlSession = sqlSession;
		sender = new Sender( Constants.GCM_API_KEY );
	}
	
	public String sendGCMPush( String regID, Message message ) throws Exception
	{
		Result pushResult = sender.send(message, regID , Constants.push_retry_count);
		
		if ( pushResult == null ) return "";
		
		return pushResult.toString();
	}
}
