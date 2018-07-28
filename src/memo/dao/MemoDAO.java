package memo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import memo.dto.MemoDTO;
import sqlmap.MybatisManager;

public class MemoDAO {
	
	public void deleteMemo(int idx){
		SqlSession session
			=MybatisManager.getInstance().openSession();
		session.delete("memo.delete", idx);
		session.commit();
		session.close();
	}
	
	public void updateMemo(MemoDTO dto){
		//mybatis의 객체(Connection+Statement)
		SqlSession session
			=MybatisManager.getInstance().openSession();
		session.update("memo.update", dto);
		session.commit();
		session.close();
	}
	
	public MemoDTO viewMemo(int idx){
		SqlSession session
			=MybatisManager.getInstance().openSession();
		MemoDTO dto=session.selectOne("memo.view", idx);
		session.close();
		return dto;
	}
	
	public void insertMemo(MemoDTO dto){
		//mybatis 실행 객체 생성
		SqlSession session
			=MybatisManager.getInstance().openSession();
//		String writer=dto.getWriter();
//		//공백 문자 처리(스페이스 2개를 변환)
//		writer=writer.replace("  ", "&nbsp;&nbsp;");
//		//태그 문자 처리
//		writer=writer.replace("<", "&lt;"); //Less Than ~보다 작다
//		writer=writer.replace(">", "&gt;"); //Greater Than ~보다 크다
//		dto.setWriter(writer);
//		
//		String memo=dto.getMemo();
//		//공백 문자 처리(스페이스 2개를 변환)
//		memo=memo.replace("  ", "&nbsp;&nbsp;");
//		//태그 문자 처리
//		memo=memo.replace("<", "&lt;"); //Less Than ~보다 작다
//		memo=memo.replace(">", "&gt;"); //Greater Than ~보다 크다
//		dto.setMemo(memo); 
		
		session.insert("memo.insert", dto); //레코드 추가
		session.commit(); //수동 커밋
		session.close(); //mybatis 세션 닫기
	}
	
	public List<MemoDTO> listMemo(String searchkey, String search){
		//mybatis 실행 객체 생성
//MybatisManager.getInstance()=>SqlSessionFactory		
		SqlSession session
			=MybatisManager.getInstance().openSession();
		// memo.xml에 저장된 sql 문장을 실행
		// namespace.id
		List<MemoDTO> list=null;
		try {
			if(searchkey.equals("writer_memo")){//이름+메모로 검색
				list=session.selectList("memo.listAll",search);
			}else{ 
				Map<String,String> map=new HashMap<>();
				map.put("searchkey", searchkey);
				map.put("search", search);
// 입력매개변수는 1개만 전달할 수 있음				
				list=session.selectList("memo.list", map);
			}
			for(MemoDTO dto : list){
				String memo=dto.getMemo();
				//공백 문자 처리(스페이스 2개를 변환)
				memo=memo.replace("  ", "&nbsp;&nbsp;");
				//태그 문자 처리
				memo=memo.replace("<", "&lt;"); //Less Than ~보다 작다
				memo=memo.replace(">", "&gt;"); //Greater Than ~보다 크다
				//키워드에 색상 처리
				if(searchkey.equals("memo")){
					if(memo.indexOf(search) != -1){
						memo=memo.replace(search, 
								"<font color='red'>"+ search +"</font>");
					}
				}
				dto.setMemo(memo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		//mybatis 객체 닫기
		return list;
	}
}











