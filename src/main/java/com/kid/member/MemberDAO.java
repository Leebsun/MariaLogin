package com.kid.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kid.member.MemberDTO;


@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "memberMapper.";
	
//일반회원 selectOne
	public MemberDTO selectOne(int member_seq) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"selectOne", member_seq);
	}
	
//일반회원 아이디 체크
	public String memberIdCheck(String checkId) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberIdCheck", checkId);
	}
	
//일반회원  JOIN
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
	}
//일반회원 LOGIN
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}
	
	//state Update
		public int stateUpate(MemberDTO memberDTO) throws Exception {
			
			return sqlSession.update(NAMESPACE+"stateUpdate", memberDTO);
		}

		
}
