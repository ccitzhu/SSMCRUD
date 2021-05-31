import com.zmz.Bean.Employee;
import com.zmz.Dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author 朱铭泽
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class test {
    @Autowired
    EmployeeMapper employeeMapper;
    @Test
    public  void  test(){
        List<Employee> employees = employeeMapper.selectByExampleWithdept(null);
        System.out.println(employees);
    }
}
