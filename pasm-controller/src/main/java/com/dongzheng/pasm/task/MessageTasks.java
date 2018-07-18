package com.dongzheng.pasm.task;

import com.alibaba.fastjson.JSON;
import com.dongzheng.pasm.controller.MessageController;
import com.dongzheng.pasm.core.entity.User;
import com.dongzheng.pasm.core.service.IClientqueryRequestService;
import com.dongzheng.pasm.core.service.IMessageService;
import com.dongzheng.pasm.service.WebSocketService;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.util.List;

/**
 * @author:wangyang
 * @Description:
 * @since 2018/7/13 15:16
 * 8 @Modificd By:
 */
@Component
public class MessageTasks {
    //定义一个全局的记录器，通过LoggerFactory获取
    private final static Logger logger = LoggerFactory.getLogger(MessageTasks.class);
    @Autowired
    private IClientqueryRequestService iClientqueryRequestService;
    @Autowired
    private IMessageService iMessageService;
    //session作为用户简历连接的唯一会话，可以用来区别每个用户
    private Session session;
    //httpsession用以在建立连接的时候获取登录用户的唯一标识（登录名）,获取到之后以键值对的方式存在Map对象里面
    private static HttpSession httpSession;

    public static void setHttpSession(HttpSession httpSession) {
        MessageTasks.httpSession = httpSession;
    }

    //每2分钟执行一次
    @Scheduled(cron = "0 */1 *  * * * ")
    public void reportCurrentByCron() {
        try {
            //获取当前登陆用户id 即查询用户的门店号
            String sid = (String) httpSession.getAttribute("uid");
            String branchId = sid;//user.getId().toString();
            List<Object> msgList = iClientqueryRequestService.findAllByBranckId(Integer.parseInt(sid));
            if (msgList.size()>0) {
                boolean isPush = WebSocketService.sendInfo(JSON.toJSONString(msgList), sid);
                if (isPush) {
                    //推送成功落地数据
                    iMessageService.batchInsert(msgList);
                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
