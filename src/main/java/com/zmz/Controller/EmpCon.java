package com.zmz.Controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zmz.Bean.Employee;
import com.zmz.Service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author 朱铭泽
 */
@Controller
public class EmpCon {
    @Autowired
    EmployeeService employeeService;
  /*  //导入Jackson包
    @RequestMapping("/emps")
    @ResponseBody
    public Message getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Employee> employees=employeeService.getall();
//        对查询出的结果进行包装，传入连续显式的页数
        PageInfo page=new PageInfo(employees,5);
        return Message.sucess().add("pageinfo",page);
    }*/
   @RequestMapping("/emps")
    public String getemp(Model model, @RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Employee> employees=employeeService.getall();
//        对查询出的结果进行包装，传入连续显式的页数
        PageInfo page=new PageInfo(employees,5);
        model.addAttribute("PageInfo",page);
        return "list";
    }
    @RequestMapping("/add")
    public String toadd(){
       return "add";
    }
    @PostMapping("/addemps")
    public String add(Employee employee,Model model){
        int add = employeeService.add(employee);
        System.out.println(employee);
        model.addAttribute("nums",add);
        return "list";
    }
}
