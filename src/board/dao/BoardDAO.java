package board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardCommentDTO;
import board.dto.BoardDTO;
import sqlmap.MybatisManager;

public class BoardDAO {
	
	public int count(){
		int result=0;
		//try~with문 (java1.7부터 사용 가능)
		try(SqlSession session
				=MybatisManager.getInstance().openSession()) {
			result = session.selectOne("board.count");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int count2(String search_option, String keyword){
		int result=0;
		//try~with문 (java1.7부터 사용 가능)
		try(SqlSession session
				=MybatisManager.getInstance().openSession()) {
			Map<String,String> map = new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", "%"+keyword+"%");
			result = session.selectOne("board.count2",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<BoardDTO> searchList(
				String search_option,String keyword,int start, int end){
		List<BoardDTO> list=null;
		try( SqlSession session
				=MybatisManager.getInstance().openSession() ) {
			Map<String,Object> map = new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", "%"+keyword+"%");
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("board.searchList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	public void delete(int num){
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("board.delete", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	public void update(BoardDTO dto){
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			//네임스페이스.태그의id
			session.update("board.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	//비밀번호 체크
	public String passwdCheck(int num, String passwd){
		String result=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("num", num);
			map.put("passwd", passwd);
			result=session.selectOne("board.pass_check", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return result;
	}
	
	//답글 쓰기
	public void reply(BoardDTO dto){
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("board.reply", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	//답글의 순서 조정
	public void updateStep(int ref, int re_step){
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			BoardDTO dto=new BoardDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("board.updateStep", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	//댓글 추가
	public void commentAdd(BoardCommentDTO dto){
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("board.commentAdd", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	//댓글 목록을 구하는 코드
	public List<BoardCommentDTO> commentList(int num){
		List<BoardCommentDTO> list=null;
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			list=session.selectList("board.commentList", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	
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
	
	public BoardDTO viewReplace(int num){
		BoardDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("board.view", num);
			//줄바꿈 처리
			String content=dto.getContent();
			content=content.replace("\n","<br>");
			dto.setContent(content); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
		return dto;		
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
	public List<BoardDTO> list(int start, int end){
		List<BoardDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			//네임스페이스.태그의id
			Map<String,Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("board.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
}









