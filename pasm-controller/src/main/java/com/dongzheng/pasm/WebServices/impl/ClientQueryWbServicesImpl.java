package com.dongzheng.pasm.WebServices.impl;

import com.dongzheng.pasm.WebServices.ClientQueryWbServices;

import javax.jws.WebService;
import javax.xml.ws.Endpoint;

@WebService
public class ClientQueryWbServicesImpl implements ClientQueryWbServices {
    @Override
    public String clientQueryNotify(String name) {
        return "收到了";
    }

    //通过EndPoint(端点服务)发布一个WebService
    public static void main(String[] args) {
        //1,本地的服务地址;2,提供服务的类;
        Endpoint.publish("http://localhost:8081/Service/ClientQueryWbServices", new ClientQueryWbServicesImpl());
        System.out.println("发布成功!");
        //发布成功后 在浏览器输入 http://localhost:8081/Service/ClientQueryWbServices?wsdl
    }
}

