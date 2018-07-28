package guestbook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import guestbook.dto.GuestBookDTO;
import sqlmap.MybatisManager;

public class GuestBookDAO {
	
	//게시물 삭제
	public void gbDelete(int idx){
		SqlSession session
			=MybatisManager.getInstance().openSession();
		session.delete("guestbook.gbDelete", idx);
		session.commit();
		session.close();
	}
	
	//게시물 수정
	public void gbUpdate(GuestBookDTO dto){
		SqlSession session
			=MybatisManager.getInstance().openSession();
		session.update("guestbook.gbUpdate", dto);
		//insert,update,delete 명령어는 반드시 commit을 해야 함
		session.commit();
		session.close();
	}
	
	//게시물의 상세정보 (idx: 게시물번호)
	public GuestBookDTO gbDetail(int idx){
		GuestBookDTO dto=new GuestBookDTO();
		SqlSession session
			=MybatisManager.getInstance().openSession();
		dto = session.selectOne("gbDetail", idx);
		session.close();
		return dto;
	}
	
	
	//비밀번호 체크(idx:게시물번호, passwd 사용자의 입력값)
	public boolean passwdCheck(int idx, String passwd){
		boolean result=false;
		//mybatis 실행 객체
		SqlSession session
			= MybatisManager.getInstance().openSession();
		GuestBookDTO dto=new GuestBookDTO();
		dto.setIdx(idx);
		dto.setPasswd(passwd);
		//레코드가 1개가 리턴될 경우 selectOne
		int count=session.selectOne("passwdCheck", dto);
		session.close(); //mybatis session 닫기
		if(count==1){
			result=true;
		}
		return result;
	}
	
	//방명록 insert
	public void gbInsert(GuestBookDTO dto){
		SqlSession session
			=MybatisManager.getInstance().openSession();
		session.insert("gbInsert", dto);
		session.commit();
		session.close();
	}
	
	//방명록 목록을 리턴
	public List<GuestBookDTO> getList(String searchkey, String search){
		//mybatis 실행 객체
		SqlSession session=
				MybatisManager.getInstance().openSession();
		//mybatis에서는 반드시 List 사용(ArrayList 사용 금지)
		// selectList("네임스페이스.아이디")
		
		List<GuestBookDTO> list=null;
		if(searchkey.equals("name_content")){ //이름 + 내용
			list=session.selectList("gbListAll","%"+search+"%");
		}else{
// mybatis의 method에는 2개 이상의 parameter를 전달할 수 없음
			Map<String,String> map=new HashMap<>();
			// map.put(key,value) key 변수명, value 값
			map.put("searchkey", searchkey);
			map.put("search", "%"+search+"%");
			list=session.selectList("gbList",map);
		}
//		List - 순서대로 저장, 추가/삭제
//		Map - 순서대로 저장x, key를 이용한 빠른 조회
//		Set - 순서대로 저장x, 중복값 허용x
//		
		for(GuestBookDTO dto : list){
			String content=dto.getContent();
//			// 태그 문자 처리
			content=content.replace("<", "&lt;");
			content=content.replace(">", "&gt;");
//			// 줄바꿈 처리 : replace(A,B) A를 B로 변경
			content=content.replace("\n", "<br>");
//			// 공백 문자 처리
			content=content.replace("  ", "&nbsp;&nbsp;");
//			// 키워드 색상 처리
			if(!searchkey.equals("name")) {
				content=content.replace(search
,"<span style='color:red'>"+search+"</span>");
			}
			dto.setContent(content); 
		}
		session.close(); //mybatis 세션 닫기
		return list;
	}
}











