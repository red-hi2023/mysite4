package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BoardService;
import com.javaex.vo.BoardVo;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	//리스트
	@RequestMapping(value="/board/list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(Model model) {
		System.out.println("BoardController.list()");
		
		//boardService를 통해서 리스트를 가져온다
		List<BoardVo> boardList = boardService.getBoardList();
		//모델에 리스트를 담는다(포워드)
		model.addAttribute("boardList", boardList);
		
		return "board/list";
	}
	
	//글읽기
	@RequestMapping(value="/board/read", method= {RequestMethod.GET, RequestMethod.POST})
	public String read(@RequestParam(value="no") int no, Model model) {
		System.out.println("BoardController.read()");
		
		//글1개가져오기
		BoardVo boardVo = boardService.getBoard(no);
		
		//화면에 보내기 (포워딩)
		model.addAttribute("boardVo", boardVo);
		
		return "/board/read";
	}
	
	
	
	
}
