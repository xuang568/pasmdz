package com.dongzheng.pasm.controller;

import com.dongzheng.pasm.core.common.DateEditor;
import com.dongzheng.pasm.core.entity.Blacklist;
import com.dongzheng.pasm.core.entity.Clientquery;
import com.dongzheng.pasm.core.entity.User;
import com.dongzheng.pasm.core.service.IBlacklistService;
import com.dongzheng.pasm.core.service.IClientqueryService;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author xa
 * @since 2018-06-10
 */
@Controller
@RequestMapping("/pasm")
public class PreApprovedController extends BaseController{

    //定义一个全局的记录器，通过LoggerFactory获取
    private final static Logger logger = LoggerFactory.getLogger(PreApprovedController.class);

    @Autowired
    private IClientqueryService clientqueryService;

    @Autowired
    private IBlacklistService blacklistService;

    /**
    * 首次预授信查询页面
    * */
    @RequestMapping(value = {"/index"})
    public String index(ModelMap modelMap) {
        return "pasm/index";
    }

    /**
    * 查询历史预授信结果集合
    * */
    @RequestMapping(value = {"/history"})
    public String history(ModelMap modelMap) {
        try {
            //获取当前登陆用户id 即查询用户的门店号
            User user = (User) SecurityUtils.getSubject().getPrincipal();
            logger.info("当前用户："+user.getUserName()+"发起查询所有权限下的预授信记录...");
            Page<Clientquery> page=null;
           if("admin".equals(user.getUserName())){
                page = clientqueryService.findAll(getPageRequest());
            }else {
               page = clientqueryService.findAll(getPageRequest());
               Iterator<Clientquery> iterator = page.iterator();
               while (iterator.hasNext()){
                   Clientquery next = iterator.next();
                   if(!user.getId().equals(next.getBranchId())){
                       iterator.remove();
                   }
               }
           }
            modelMap.put("pageInfo", page);
            logger.info("当前用户:"+user.getUserName()+"查询所有权限下的预售信记录:"+page.iterator());
        }catch (Exception e){
            e.printStackTrace();
        }
        return "pasm/history";
    }

    /**
    * 发起查询请求，返回查询页面到前端
    * */
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public String query(ModelMap modelMap) {
        return "pasm/query";
    }


    /**
    * 根据客户身份证号来查询客户预授信结果
    * */
    @ResponseBody
    @RequestMapping(value = {"/queryInfo"})
    public Clientquery queryInfo(@RequestParam String idCardNo, ModelMap map) {
        Clientquery clientquery=null;
        if(idCardNo!=null){
            clientquery = clientqueryService.queryInfo(idCardNo);
        }
        return clientquery;
    }

    /**
    * 首次查询客户预授信发起请求
    * */
    @ResponseBody
    @RequestMapping(value = {"/queryFirst"})
    public Clientquery queryFirst(Clientquery clientquery, ModelMap map) {
        Clientquery query=new Clientquery();
       try {
           //01黑名单校验
           logger.info("blacklistService findByidCard param:",clientquery.getIdCardNo());
           List<Blacklist> byidCard = blacklistService.findByidCard(clientquery.getIdCardNo());
           logger.info("blacklistService findByidCard result:",byidCard);
           if(byidCard.size()>0){
               clientquery.setQueryResult("03");
               return clientquery;
           }
           //获取当前登陆用户id 即查询用户的门店号
           User user = (User) SecurityUtils.getSubject().getPrincipal();
           logger.info("currentUser："+user.getUserName()+"queryClientqueryStart:"+clientquery);
           //密等性校验
           Date date=new Date();
           query = clientqueryService.queryInfo(clientquery.getIdCardNo());
           //首次查询，有限期30天校验
           if(query!=null && (date.getTime()-query.getQueryTime().getTime())/(24*60*60*1000)<30){
               logger.info("currentUser：{}"+user.getUserName()+"queryClientqueryResult:"+query);
               return query;
           }
           clientquery.setBranchId(user.getId());
           clientquery.setQueryTime(date);
           query = clientqueryService.queryFirst(clientquery);
           logger.info("currentUser："+user.getUserName()+"queryFirstClientqueryResult:"+query);

       }catch (Exception e){
          e.printStackTrace();
       }
        return query;
    }

}
