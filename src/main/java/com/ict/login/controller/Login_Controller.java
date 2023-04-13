package com.ict.login.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.login.model.dao.Login_DAO;
import com.ict.login.model.service.Login_Service;
import com.ict.member.model.vo.MemberVO;

@Controller
public class Login_Controller {
	@Autowired
	private Login_Service login_Service;

	public void setLogin_Service(Login_Service login_Service) {
		this.login_Service = login_Service;
	}

	@RequestMapping("login_login.do")
	public ModelAndView getLogin() {
		return new ModelAndView("login/login_login");
	}

	@RequestMapping(value = "login_login_ok.do", method = RequestMethod.POST)
	public ModelAndView getMemberLogin(HttpServletRequest request, @RequestParam("m_id") String id,
			@RequestParam("m_pw") String pw) {

		MemberVO mvo = login_Service.findIdPw(id);
		// 아이디가 있는지 없는지 확인
		// 받는건 vo로 받는다
		// 조건: id

		// null 이면 아이디가 없음
		// 그 반대는 아이디 있음

		// 있으면 vo에 내용이 담겨있음
		// vo에 담겨있는 패스워드.equals 받은패스워드
		// 해서 맞으면 패스워드 맞음

		 //System.out.println("id:"+id);
		if (mvo != null) {
			if (mvo.getPw().equals(pw)) {
				// System.out.println("pw:"+pw);
				request.getSession().setAttribute("login", "ok");
				request.getSession().setAttribute("memberID", id);
				return new ModelAndView("redirect:main_page.do");
			}
		}
		return new ModelAndView("redirect:login_login.do");
	}

	@RequestMapping("login_find_id.do")
	public ModelAndView getFindIDPage() {
		return new ModelAndView("login/login_find_id_pw");
	}

	@RequestMapping("login_find_id_email.do")
	public ModelAndView getFindID_emailPage() {
		return new ModelAndView("login/login_find_id_pw_email");
	}

	@RequestMapping("login_id_check.do")
	@ResponseBody
	public String getIdChk(@RequestParam("id") String id) {

		String result = "0";
		int chk = login_Service.checkId(id);
		if (chk == 1)
			result = "1";
		return result;
	}

	@RequestMapping("login_sign_up.do")
	public ModelAndView getSignUp(MemberVO mvo, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("login/login_sign_up");
		mv.addObject("id", mvo.getId());

		return mv;
	}

	@RequestMapping("login_sign_up_next.do")
	public ModelAndView getSignUpNext(MemberVO mvo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("login/login_sign_up_next");

		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		int result = login_Service.getMemberJoin(mvo);
		mv.addObject("id", id);
		return mv;
	}

	@RequestMapping("login_sign_up_final.do")
	public ModelAndView getSignUpFinal(HttpServletRequest request, @RequestParam("id") String id) {

		/*
		 * , @RequestParam("id") String id,
		 * 
		 * @RequestParam("nickname") String nickname, @RequestParam("sample3_postcode")
		 * String sample3_postcode,
		 * 
		 * @RequestParam("sample3_address") String sample3_address,
		 * 
		 * @RequestParam("sample3_detailAddress") String sample3_detailAddress,
		 * 
		 * @RequestParam("sample3_extraAddress") String sample3_extraAddress
		 */

		String nickname = request.getParameter("nickname");
		String sample3_postcode = request.getParameter("sample3_postcode");
		String sample3_address = request.getParameter("sample3_address");
		String sample3_detailAddress = request.getParameter("sample3_detailAddress");
		String sample3_extraAddress = request.getParameter("sample3_extraAddress");

		String address = sample3_postcode;
		address = address.concat("/");
		address = address.concat(sample3_address);
		address = address.concat("/");
		address = address.concat(sample3_detailAddress);
		address = address.concat("/");
		address = address.concat(sample3_extraAddress);
		request.getSession().setAttribute("login", "ok");

		ModelAndView mv = new ModelAndView("login/login_sign_up_final");
		MemberVO mvo = login_Service.getSignId(id);
		mvo.setAddress(address);
		mvo.setNickname(nickname);
		// request.getSession().setAttribute("memberID", id);
		int result = login_Service.getMemberAdd(mvo);

		// 회원 폴더 생성(본인 폴더 루트로 바꿔주세요)
		String path = "D:\\kmj\\springstudy\\nanum\\src\\main\\webapp\\resources\\upload\\" + id + "\\attach";
		String path2 = "D:\\kmj\\springstudy\\nanum\\src\\main\\webapp\\resources\\upload\\" + id + "\\s_editor";
		File folder = new File(path);
		File folder2 = new File(path2);

		if (!folder.exists()) {
			try {
				folder.mkdirs(); 
				folder2.mkdirs(); 
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
		}

		return mv;

	}

	@RequestMapping("login_kakao_login.do")
	public ModelAndView getKakaoLogin(HttpServletRequest request) {
		// 1. 인증 코드 받기
		String code = request.getParameter("code");

		// 2. 토큰 받기
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 conn.setDoOutput(true) 지정

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

			// 필요로 요구하는 파라미터를 스트림을 통해서 전송하자
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuffer sb = new StringBuffer();
			sb.append("grant_type=authorization_code");
			// sb.append("&client_id=ecf16dad0bf2a470548b7a10f0a60323");
			// sb.append("&redirect_uri=http://localhost:8083/login_kakao_login.do");
			sb.append("&client_id=ba35fcb2b495ffa24babfedb6d4d6492");
			sb.append("&redirect_uri=http://localhost:8090/login_kakao_login.do");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();

			// 요청을 통해 얻은 JSON 타입의 메세지를 읽자
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			br.close();
			bw.close();

			JSONParser parser = new JSONParser();
			Object obj = parser.parse(result.toString());
			JSONObject j_obj = (JSONObject) obj;
			String access_token = (String) j_obj.get("access_token");
			String refresh_token = (String) j_obj.get("refresh_token");

			request.getSession().setAttribute("access_token", access_token);
			request.getSession().setAttribute("refresh_token", refresh_token);
			request.getSession().setAttribute("login", "ok");
			request.getSession().setAttribute("memberID", "coffee");

		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("main_page");
	}
}
