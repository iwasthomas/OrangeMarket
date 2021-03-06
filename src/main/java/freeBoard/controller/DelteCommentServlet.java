package freeBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeBoard.model.service.FreeService;

/**
 * Servlet implementation class DelteCommentServlet
 */
@WebServlet(name = "DelteComment", urlPatterns = { "/deleteComment" })
public class DelteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelteCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		
		//2.값추출
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		int freeNo = Integer.parseInt(request.getParameter("freeNo"));
		
		//3.비즈니스로직
		int result = new FreeService().deleteComment(commentNo);
		
		//4. 결과처리
			RequestDispatcher view 
			= request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			if(result>0) {
				request.setAttribute("msg", "삭제완료");
			}else {
				request.setAttribute("msg", "삭제실패");
			}
			request.setAttribute("loc", "/freeView?freeNo="+freeNo);
			view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
