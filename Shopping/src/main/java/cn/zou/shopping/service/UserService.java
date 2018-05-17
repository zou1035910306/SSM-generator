package cn.zou.shopping.service;

import cn.zou.shopping.bean.User;
import cn.zou.shopping.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 邹创基 on 2018/5/17 10:51
 *
 * @Description:
 */
@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    /**
     * 查询所有用户
     * @return
     */
    public List<User> getAll(){
        return userMapper.selectByExample(null);
    }



}
