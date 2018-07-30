package board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardDTO;
import sqlmap.MybatisManager;

public class BoardDAO {

	//게시물 저장
	public void insert(BoardDTO dto){
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			//namespace.id
			System.out.println("dao dto:"+dto);
			session.insert("board.insert", dto);
			session.commit(); //auto commit 아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	//게시물 목록 리턴
	public List<BoardDTO> list(){
		List<BoardDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			//네임스페이스.태그의id
			list=session.selectList("board.list");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
}









