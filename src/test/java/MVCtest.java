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

/**
 * @author 朱铭泽
 */
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:web/WEB-INF/dispatcher-servlet.xml"})
public class MVCtest {
        @Autowired
        WebApplicationContext context;
        //虚拟的MVC处理请求
        MockMvc mockMvc;
        @Before
        public  void initmockmvc(){
            mockMvc= MockMvcBuilders.webAppContextSetup(context).build();
        }
        @Test
        public  void testpage() throws Exception {
            MvcResult result=mockMvc.perform(MockMvcRequestBuilders.
                    get("/emps").param("pn","1")).andReturn();
            MockHttpServletRequest request = result.getRequest();
            PageInfo lists =(PageInfo)request.getAttribute("list");
            System.out.println("需要连续显式的页码");
            int[] navigatepageNums = lists.getNavigatepageNums();
              for(int i :navigatepageNums){
                  System.out.println(i);
              }
        }
    }

