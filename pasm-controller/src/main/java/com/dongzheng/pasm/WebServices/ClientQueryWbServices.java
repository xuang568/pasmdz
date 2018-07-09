package com.dongzheng.pasm.WebServices;

import javax.jws.WebService;

/**
 * Title: ClientQueryWbService
 * Description: 基于jdk1.6以上的javax.jws 发布webservice接口
 @WebService － 它是一个注解，用在类上指定将此类发布成一个ws。
 Endpoint – 此类为端点服务类，它的方法publish用于将一个已经添加了@WebService注解
 对象绑定到一个地址的端口上。
  * Version:1.0.0
  * @author xuang
 */
@WebService
public interface ClientQueryWbServices {

    /** 供客户端调用方法  该方法是非静态的，会被发布
     * @param name  传入参数
     * @return String 返回结果
     * */
    public String clientQueryNotify(String name);
}
