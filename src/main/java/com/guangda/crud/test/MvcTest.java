package com.guangda.crud.test;

import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
//@WebAppConfiguration
public class MvcTest {

    //传入SpringMvc的ioc
    @Autowired
    WebApplicationContext context;

    //虚拟mvc请求
    MockMvc mockMvc;

    @Before
    public void initMockMvc(){
        mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求得到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();

        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
        System.out.println("当前页码:" +pageInfo.getPageNum());
        System.out.println("总页码:" +pageInfo.getPages());
        System.out.println("总记录数:" +pageInfo.getTotal());
        System.out.println("在页面连续显示的页码:" );
        int[] nums = pageInfo.getNavigatepageNums();
        for (int num : nums) {
            System.out.print(num+" ");
        }
    }
}
