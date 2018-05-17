package cn.zou.shopping.test;

import cn.zou.shopping.bean.Role;
import cn.zou.shopping.bean.User;
import cn.zou.shopping.dao.RoleMapper;
import cn.zou.shopping.dao.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * Created by 邹创基 on 2018/5/17 10:51
 * @Description: 测试dao层的工作
 * 推荐Spring的项目就可以使用Spring的单元测试类，可以自动注入需要我们需要的组件
 * 1.导入SpringTest模块
 * 2.@ContextConfiguration指定配置文件的位置
 * 3.直接@Autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml"})
public class MapperTest {

    @Autowired
    User user;

    @Autowired
    Role role;

    @Autowired
    SqlSession sqlSession;

    /**
     * 测试DepartmentMapper
     */
    @Test
    public void testCRUD(){


        System.out.println(user);

        RoleMapper mapper1=sqlSession.getMapper(RoleMapper.class);
        mapper1.insertSelective(new Role("超级管理员","拥有所有权限"));
        mapper1.insertSelective(new Role("普通管理员","拥有除处理超级管理员外及修改用户权限外所有部分权限"));
        mapper1.insertSelective(new Role("普通用户","拥有浏览网页，购买商品权限"));

        UserMapper mapper2 = sqlSession.getMapper(UserMapper.class);
        for(int i=0;i<10;i++){
            String nickname = UUID.randomUUID().toString().substring(0,5)+i;
            mapper2.insertSelective(new User("zou","12345"+"i",nickname,1));
            System.out.println("批量完成！！");
        }
    }
}
















