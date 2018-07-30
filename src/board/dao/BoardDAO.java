package board.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardDTO;
import sqlmap.MybatisManager;

public class BoardDAO {
	
	//조회수 증가 처리
	public void plusReadCount(int num,HttpSession count_session){
		SqlSession session=null;
		try {
			long read_time=0;
			if(
count_session.getAttribute("read_time_"+num)!=null){
				read_time=
(long)count_session.getAttribute("read_time_"+num);
			}
			long current_time=System.currentTimeMillis();//현재시각
			session=MybatisManager.getInstance().openSession();
			if(current_time-read_time>5*1000){
				session.update("board.plusReadCount", num);
				session.commit();
				//최근 열람 시각 업데이트
				count_session.setAttribute(
						"read_time_"+num, current_time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	public BoardDTO view(int num){
		BoardDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("board.view", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
		return dto;
	}
	
	//다운로드 횟수 증가 처리
	public void plusDown(int num){
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("board.plusDown", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	//첨부파일 이름 찾기
	public String getFileName(int num){ 
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			result=session.selectOne("board.getFileName", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return result;
	}
	
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









