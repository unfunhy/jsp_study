package study0926;

import java.sql.*;
import java.util.ArrayList;

public class DBconnector {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String DB_URL = "jdbc:mysql://localhost/study_db?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true";

	private final String USER_NAME = "ex";
	private final String PASSWORD = "asdf1234";

	private Client client = new Client();

	public Client returnClient() {
		return this.client;
	}

	public int GetInfoFromDB(String username, String password) {
		int state_connection = 0; // 0 not connected to DB, 1 incorrect password, 3 sign-in successfully
		Connection conn = null;
		Statement state = null;

		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			state = conn.createStatement();

			String sql;
			sql = "select password from user_info where username=\'" + username + "\'";
			ResultSet rs = state.executeQuery(sql);

			if (rs.next()) {
				if (password.equals(rs.getString("password"))) {
					sql = "select * from user_info where username=\'" + username + "\'";
					rs = state.executeQuery(sql);

					if (rs.next()) {
						client.setUsername(rs.getString("username"));
						client.setAge(rs.getInt("age"));
						client.setSex(rs.getString("sex"));
						client.setPhone(rs.getString("phone"));
						client.setAddr(rs.getString("addr"));

						rs.close();
						state_connection = 3;
					} else {
						state_connection = 2;
					}
				} else {
					state_connection = 1;
				}
			} else {
				state_connection = 1;
			}

			state.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
			} catch (SQLException e) {
				System.out.println(e);
			}
		}
		return state_connection;
	}

	public int SetInfoToDB(String username, String password, int age, String sex, String phone, String addr) {
		int state_connection = 0; // 0 not connected to DB, 1 same user name already exist , 3 success
		Connection conn = null;
		Statement state = null;
		PreparedStatement pre_state = null;

		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			state = conn.createStatement();

			String sql;
			sql = "select id from user_info where username=\'" + username + "\'";

			if (state.executeQuery(sql).next()) {
				state_connection = 1;
			} else {
				sql = "insert into user_info (username, password, age, sex, phone, addr) values (?, ?, ?, ?, ?, ?)";
				pre_state = conn.prepareStatement(sql);

				pre_state.setString(1, username);
				pre_state.setString(2, password);
				pre_state.setInt(3, age);
				pre_state.setString(4, sex);
				pre_state.setString(5, phone);
				pre_state.setString(6, addr);

				pre_state.executeUpdate();

				state_connection = 3;
			}
			pre_state.close();
			state.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
			} catch (SQLException e) {
				System.out.println(e);
			}
		}
		return state_connection;
	}

	public int GetPostCount(String condition) {
		Connection conn = null;
		Statement state = null;
		int count=0;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			state = conn.createStatement();
			
			String sql;
			sql = "select count(id) from board "+condition;
			ResultSet rs = state.executeQuery(sql);
			if (rs.next()) {
				count = rs.getInt("count(id)");
			}

			rs.close();
			state.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
			} catch (SQLException e) {
				System.out.println(e);
			}
		}

		return count;
	}
	
	public ArrayList<Board> ReadBoard(String index, String numberOfPost, String condition) {
		Connection conn = null;
		Statement state = null;

		ArrayList<Board> board = new ArrayList<>();

		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			state = conn.createStatement();
			
			String startIndex = "";
			String sql;
			
			startIndex = Integer.toString(Integer.parseInt(index) * Integer.parseInt(numberOfPost));
			
			sql = "select * from board "+condition+" order by id desc limit "+startIndex+","+numberOfPost;
			System.out.println(sql);
			
			ResultSet rs = state.executeQuery(sql);

			while (rs.next()) {
				Board bor = new Board();

				bor.setId(rs.getString("id"));
				bor.setTag(rs.getString("tag"));
				bor.setTitle(rs.getString("title"));
				bor.setUsername(rs.getString("username"));
				bor.setC_date(rs.getString("c_date"));
				bor.setContents(rs.getString("contents"));
				bor.setImage(rs.getBlob("img"));
				bor.setViews(rs.getString("views"));

				board.add(bor);
			}

			rs.close();
			state.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
			} catch (SQLException e) {
				System.out.println(e);
			}
		}

		return board;
	}

	public String[] ReadPost(String id) {
		String[] sender = new String[6];
		int views = 0;
		Connection conn = null;
		Statement state = null;
		PreparedStatement pre_state = null;

		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			state = conn.createStatement();

			String sql;
			sql = "select * from board where id=\'" + id + "\'";
			
			ResultSet rs = state.executeQuery(sql);

			if (rs.next()) {
				sender[0] = id;
				sender[1] = rs.getString("tag");
				sender[2] = rs.getString("title");
				sender[3] = rs.getString("c_date");
				sender[4] = rs.getString("contents");
				sender[5] = rs.getString("username");
				views = Integer.parseInt(rs.getString("views")) + 1;
				rs.close();
			}
			
			sql = "update board set views=? where id=?";
			
			pre_state = conn.prepareStatement(sql);
			
			pre_state.setInt(1, views);
			pre_state.setString(2, id);
			
			pre_state.executeUpdate();

			state.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
			} catch (SQLException e) {
				System.out.println(e);
			}
		}

		return sender;
	}

	public int CreatePost(String tag, String title, String username, String c_date, String contents) {
		int state_connection = 0; // 0 not connected to DB, 1 incorrect password, 3 sign-in successfully
		Connection conn = null;
		Statement state = null;
		PreparedStatement pre_state = null;

		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			state = conn.createStatement();

			String sql;
			sql = "insert into board (tag, title, username, c_date, contents) values (?, ?, ?, ?, ?)";
			pre_state = conn.prepareStatement(sql);

			pre_state.setString(1, tag);
			pre_state.setString(2, title);
			pre_state.setString(3, username);
			pre_state.setString(4, c_date);
			pre_state.setString(5, contents);

			pre_state.executeUpdate();
			state_connection = 3;

			pre_state.close();
			state.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
			} catch (SQLException e) {
				System.out.println(e);
			}
		}
		return state_connection;
	}

	public int UpdatePost(String id, String tag, String title, String c_date, String contents) {
		int state_connection = 0; // 0 not connected to DB, 1 incorrect password, 3 sign-in successfully
		Connection conn = null;
		Statement state = null;
		PreparedStatement pre_state = null;

		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			state = conn.createStatement();

			String sql;
			sql = "update board set contents=?, tag=?, title=?, c_date=?  where id=?";
			
			pre_state = conn.prepareStatement(sql);

			pre_state.setString(1, contents);
			pre_state.setString(2, tag);
			pre_state.setString(3, title);
			pre_state.setString(4, c_date);
			pre_state.setString(5, id);

			pre_state.executeUpdate();
			
			state_connection = 3;
			pre_state.close();
			state.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
			} catch (SQLException e) {
				System.out.println(e);
			}
		}

		return state_connection;
	}
	
	public int DeletePost(String id) {
		int state_connection = 0; // 0 not connected to DB, 1 incorrect password, 3 sign-in successfully
		Connection conn = null;
		Statement state = null;

		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			state = conn.createStatement();

			String sql;
			sql = "delete from board where id="+ id;
			state.executeUpdate(sql);
			
			state_connection = 3;
			state.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
			} catch (SQLException e) {
				System.out.println(e);
			}
		}

		return state_connection;
	}
	
	public ArrayList<Board> SearchBoard(String tag, String text, String numberOfPost) {
		Connection conn = null;
		Statement state = null;

		ArrayList<Board> board = new ArrayList<>();

		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
			state = conn.createStatement();

			String sql;
			String condition = "where "+ tag +" like \'%"+text+"%\'";
			String startIndex = Integer.toString(0);
			
			sql = "select * from board "+condition+" order by id desc limit "+startIndex+","+numberOfPost;
			ResultSet rs = state.executeQuery(sql);

			while (rs.next()) {
				Board bor = new Board();

				bor.setId(rs.getString("id"));
				bor.setTag(rs.getString("tag"));
				bor.setTitle(rs.getString("title"));
				bor.setUsername(rs.getString("username"));
				bor.setC_date(rs.getString("c_date"));
				bor.setContents(rs.getString("contents"));
				bor.setImage(rs.getBlob("img"));

				board.add(bor);
			}

			rs.close();
			state.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (state != null) {
					state.close();
				}
			} catch (SQLException e) {
				System.out.println(e);
			}
		}

		return board;
	}
}
