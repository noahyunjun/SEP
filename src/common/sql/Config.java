package common.sql;

import java.sql.Connection;
import java.sql.DriverManager;

// Enum Singleton
public class Config {
	/**
	 * DB 로그인을 대신 해주는 클래스 입니다. 로그인만 대신해주고, 쿼리문을 입력하는건 외부(DAO)에서 DBUtils 라이브러리를 사용합니다.
	 * */
	private Config() {}
	private static class Singleton {
		private static final Config instance = new Config();
	}
	
	public static Config getInstance() {
		return Singleton.instance;
	}
	// DB 커넥션 Variable
	private Connection conn = null;
	// DB 정보
//	private String url ="jdbc:mariadb://localhost:3306/sep?user=root&password=****";
	private String url ="jdbc:mariadb://localhost:3306/SEproject_DB?user=root&password=";

	public Connection sqlLogin() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연결 실패. mariaDB의 아이디 비밀번호가 Config 클래스와 일치하는지 확인해주세요.");
		}
		return conn; //DB 사용을 요구했던 메소드에게 로그인 정보를 돌려줌.

	}

}
