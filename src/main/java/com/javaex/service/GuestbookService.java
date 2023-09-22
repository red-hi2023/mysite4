package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.GuestbookDao;
import com.javaex.vo.GuestbookVo;

@Service
public class GuestbookService {

	@Autowired
	private GuestbookDao guestbookDao;

	// 전체리스트 가져오기
	public List<GuestbookVo> getGuestList() {
		System.out.println("GuestBookService>getGuestList()");

		List<GuestbookVo> guestbookList = guestbookDao.selectList();

		return guestbookList;
	}

	// 방명록 글 저장
	public int write(GuestbookVo guestbookVo) {
		System.out.println("guestbookService/write");
		
		return guestbookDao.insert(guestbookVo);
	}

	// 방명록 삭제
	public String removeGuest(GuestbookVo guestbookVo) {
		System.out.println("GuestBookService>removeGuest()");

		String state;

		int count = guestbookDao.guestDelete(guestbookVo);

		if (count > 0) {
			state = "succeess";
		} else {
			state = "fail";
		}

		return state;
	}
	
	
	//방명록 등록 ajax
	public GuestbookVo addGuest(GuestbookVo guestbookVo) {
		System.out.println("guestbookService/addGuest()");
		
		//등록
		int count = guestbookDao.insertSelectKey(guestbookVo);

		//no 의 데이터 가져오기
		// no값 확인
		int no = guestbookVo.getNo();
		// no데이터 가져오기
		
		return guestbookDao.selectGuestOne(no);
	}

}
