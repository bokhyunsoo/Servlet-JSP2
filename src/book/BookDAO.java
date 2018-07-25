package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import config.DB;

public class BookDAO {
	public ArrayList<BookDTO> bookList(){
		ArrayList<BookDTO> items=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DB.getConn(); //DB커넥션 리턴
			String sql="select * from book";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery(); //sql 실행
			while(rs.next()){ //다음 레코드가 존재하면
//				BookDTO dto=new BookDTO();
//				dto.setId(rs.getInt("id")); //rs.get자료형("필드명")
//				dto.setTitle(rs.getString("title"));
//				dto.setAuthor(rs.getString("author"));
//				dto.setPrice(rs.getInt("price"));
//				dto.setQty(rs.getInt("qty"));
//				items.add(dto); //리스트에 dto 추가
				int id=rs.getInt("id");
				String title=rs.getString("title");
				String author=rs.getString("author");
				int price=rs.getInt("price");
				int qty=rs.getInt("qty"); 
				items.add(new BookDTO(id, title, author, price, qty));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // rs=>pstmt=>conn 역순으로 닫음
			try {
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return items;
	}
}
