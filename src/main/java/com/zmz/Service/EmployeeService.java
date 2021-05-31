package com.zmz.Service;

import com.zmz.Bean.Employee;
import com.zmz.Dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 朱铭泽
 */
@Service
public class EmployeeService {
@Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getall() {
        return employeeMapper.selectByExampleWithdept(null);
    }
}
