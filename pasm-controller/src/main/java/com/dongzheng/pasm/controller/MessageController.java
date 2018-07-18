package com.dongzheng.pasm.controller;

import com.alibaba.fastjson.JSON;
import com.dongzheng.pasm.core.common.JsonResult;
import com.dongzheng.pasm.core.entity.Message;
import com.dongzheng.pasm.core.entity.User;
import com.dongzheng.pasm.core.service.IClientqueryRequestService;
import com.dongzheng.pasm.core.service.IMessageService;
import com.dongzheng.pasm.service.WebSocketService;
import com.dongzheng.pasm.task.MessageTasks;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.io.IOException;
import java.util.List;

/**
    * @Author:wangyang
    * @Description:
    * @Data: 18:10 2018/7/11
*/
@Controller
@RequestMapping("/message")
public class MessageController  extends BaseController {
    //定义一个全局的记录器，通过LoggerFactory获取
    private final static Logger logger = LoggerFactory.getLogger(MessageController.class);

    @Autowired
    private IClientqueryRequestService iClientqueryRequestService;

    @Autowired
    private IMessageService iMessageService;
    /**
     * 获取消息列表
     *
     * @param modelMap
     * @return
     */
    @RequestMapping(value = {"/index"})
    public String index(ModelMap modelMap) {
        try {
            //获取当前登陆用户id 即查询用户的门店号
            User user = (User) SecurityUtils.getSubject().getPrincipal();
            HttpSession session=request.getSession();
            session.setAttribute("uid", user.getId().toString());
            WebSocketService.setHttpSession(session);
            MessageTasks.setHttpSession(session);
            logger.info("currentUser：" + user.getUserName() + ":start find all message...");
            Page<Message> page = null;
            page = iMessageService.findAll(getPageRequest());
            modelMap.put("pageInfo", page);
            logger.info("currentUser:" + user.getUserName() + ":find all meWssage:");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "message/index";
    }

    @RequestMapping(value = "/getMsgCount", method = RequestMethod.POST)
    public void getMsgCount(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //获取当前登陆用户id 即查询用户的门店号
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        logger.info("currentUser：" + user.getUserName() + ":start find all MessageCount...");
        Integer msgCount = iClientqueryRequestService.queryTotal(user.getId());
        response.getWriter().write(JSON.toJSONString(msgCount));
    }

    @RequestMapping(value = "/getMsgList", method = RequestMethod.POST)
    public void getMsgList(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //获取当前登陆用户id 即查询用户的门店号
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        logger.info("currentUser：" + user.getUserName() + ":start find all Message...");
        List<Object> msgList = iClientqueryRequestService.findAllByBranckId(getPageRequest(), user.getId());
        response.getWriter().write(JSON.toJSONString(msgList));
    }

    //推送数据接口
    @ResponseBody
    @RequestMapping("/socketpush")
    public JsonResult pushToWeb() {
        try {
            //获取当前登陆用户id 即查询用户的门店号
            User user = (User) SecurityUtils.getSubject().getPrincipal();
            logger.info("currentUser：" + user.getUserName() + "start find all history...");
            String branchId = user.getId().toString();
            List<Object> msgList = iClientqueryRequestService.findAllByBranckId(getPageRequest(), user.getId());
            if (msgList.size()>0) {
                boolean isPush = WebSocketService.sendInfo(JSON.toJSONString(msgList), user.getId().toString());
                if (isPush) {
                    //推送成功落地数据
                    iMessageService.batchInsert(msgList);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return JsonResult.failure(e.getMessage());
        }
        return JsonResult.success();
    }
}
