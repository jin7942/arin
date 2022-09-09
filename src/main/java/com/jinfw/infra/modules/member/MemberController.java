package com.jinfw.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping (value = "/member/")
public class MemberController {

	@Autowired
	MemberServiceImpl service;
	
	/**
	 * member/memberList 접속시 실행되는 함수
	 * @param model
	 * @param vo
	 * @return memberList.jsp
	 * @throws Exception
	 */
	@RequestMapping (value = "memberList")
	public String memberList(Model model, MemberVo vo) throws Exception {
		
		System.out.println("vo.shStartDate : " + vo.getShStartDate());
		System.out.println("vo.shEnDate : " + vo.getShEndDate());
		System.out.println("vo.shOption : " + vo.getShOptionDate());
		System.out.println("vo.shValue : " + vo.getShValue());
		System.out.println("vo.shOptionValue : " + vo.getShOptionValue());
		System.out.println("vo.shOptionDelNY : " + vo.getShOptionDelNY());
		System.out.println("vo.shOptionRows : " + vo.getShOptionRows());
		
		List<Member> list = service.selectList(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		
		return "infra/member/xdmin/memberList";
	}
	
}
