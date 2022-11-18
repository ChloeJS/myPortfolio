package pp.pp.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) //junit사용해서 테스트하겠다 표시하는 어노테이션
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // 객체를 스프링컨텍스트가 주입(xml 설정파일 사용)

//Java 설정을 사용하는 경우
//@ContextConfiguration(classes= {RootConfig.class})

@Log4j //log4j를 쓰면 lombok을 통해 알아서 실행해줌 //log.info()를 사용하기 위한 어노테이션

public class DataSourceTests {
	@Autowired // RootConfig 클래스에 있는 bean들 중에서 같은 타입DataSource의 객체bean를 찾아 값을 주입한다. 
	private DataSource dataSource; // 결국 참조하고 있는 hikariConfig 값이 주입됨

	@Autowired
	private SqlSessionFactory sqlSessionFactory; // 상위개념이므로 자동형변환 -> 다형성
	
	 
	@Test
	public void testMyBatis() { // 오라클db에 접속하기 위해 생성된 bean이 잘 생성되고 db에 잘 접속이 됐는지 확인하는 테스트  
		try (SqlSession session = sqlSessionFactory.openSession();
				Connection con = session.getConnection()) {
			log.info(session);
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

	@Test
	public void testConnection() {

		try (Connection con = dataSource.getConnection()) {
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
