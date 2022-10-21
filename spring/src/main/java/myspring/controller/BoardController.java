package myspring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import myspring.model.Board;
import myspring.service.BoardService;

@Controller
public class BoardController {

		@Autowired
		private BoardService bs; 
		
		// Boardform
		@RequestMapping("boardform.do")
		public String boardform() {
			return "board/boardform";
		}
		
		// Write a new post
		@RequestMapping("boardwrite.do")
		public String boardwrite(Board board, Model model) {
			int result = bs.insert(board);
			if(result == 1) System.out.println("Successfully posted.");
			
			model.addAttribute("result", result);
			
			return "board/insertresult";
		}
		
		// Post list & pagination
		@RequestMapping("boardlist.do")
		public String boardlist(HttpServletRequest request, Model model) {
			
			int page = 1;  // current page no. //기본변수
			int limit = 10;  // limit posts on the page // 기본변수
			
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			int startRow = (page - 1) * limit + 1;
			int endRow = page * limit;
			
			int listcount = bs.getCount(); // Total data count 
			System.out.println("listcount: " + listcount);
			
			List<Board> boardlist = bs.getBoardList(page); // Post List
			System.out.println("boardlist:" + boardlist);
			
			// Total page
			int pageCount = listcount / limit + ((listcount%limit == 0)? 0 : 1);
			
			int startPage = ((page - 1) / 10) * limit + 1; //1, 11, 21,..
			int endPage = startPage + 10 - 1;			  //10, 20, 30..
			
			if(endPage > pageCount) endPage = pageCount;
			
			model.addAttribute("page", page);
			model.addAttribute("listcount", listcount);
			model.addAttribute("boardlist", boardlist);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			
			
			return "board/boardlist";
		}
		
		// Post Detail : view count +1 , Post detail
		@RequestMapping("boardcontent.do")
		public String boardcontent(int no, int page, Model model) {
			
			//View count +1
			bs.updatecount(no);
			Board board = bs.getBoard(no);
			String content = board.getContent().replace("\n", "<br>");
			
			model.addAttribute("board", board);
			model.addAttribute("content", content);
			model.addAttribute("page", page);
			
			return "board/boardcontent";
		}
		
		//Update Form 
		@RequestMapping("boardupdateform.do")
		public String boardupdateform(int no, int page, Model model) {
			
			Board board = bs.getBoard(no);	//Detail 
			
			model.addAttribute("board", board);
			model.addAttribute("page", page);
			
			return "board/boardupdateform";
		}
		
		// Update
		@RequestMapping("boardupdate.do")
		public String boardupdate(Board board, int page, Model model) {
			int result = 0;
			Board old = bs.getBoard(board.getNo());
			
			// Password Check
			if(old.getPasswd().equals(board.getPasswd())) { //Correct Password
				result = bs.update(board);			// Update 
			}else {    										//Incorrect Password
				result = -1;
			}
			model.addAttribute("result", result);
			model.addAttribute("board", board);
			model.addAttribute("page", page);

			return "board/updateresult";
		}
		
		// Delete Form
		@RequestMapping("boarddeleteform.do")
		public String boarddeleteform() {
			
			return "board/boarddeleteform";
		}
		
		// Delete
		@RequestMapping("boarddelete.do")
		public String boarddelete(Board board, int page, Model model) {
			int result = 0;
			Board old = bs.getBoard(board.getNo());		// Post Detail
			
			//Password Check
			if(old.getPasswd().equals(board.getPasswd())) { //Correct Password
				result = bs.delete(board.getNo());			// Delete
			}else {    										//Incorrect Password
				result = -1;
			}
			
			model.addAttribute("result", result);
			model.addAttribute("page", page);
			
			return"board/deleteresult";
		}
}

