package cn.zou.shopping.controller;

import cn.zou.shopping.bean.Msg;
import cn.zou.shopping.bean.User;
import cn.zou.shopping.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by 邹创基 on 2018/5/17 11:02
 *
 * @Description:
 */
@Controller
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/users")
    @ResponseBody
    public Msg getUserWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的就是一个分页查询
        List<User> users=userService.getAll();
        //使用PageInfo包装查询后的结果，只需将pageInfo交给页面就行了
        //封装了详细的分页信息，包括有我们查询的数据.连续显示的页数
        PageInfo pageInfo=new PageInfo(users,5);
        return Msg.success().add("pageInfo",pageInfo);
    }
}
