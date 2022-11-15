package com.jinfw.infra.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/code/")
public class CodeController {

    @Autowired
    CodeServiceImpl service;

    /**
     * 공통코드 리스트 조회 함수
     * 
     * @param model
     * @param vo
     * @return codeList.jsp
     * @throws Exception
     */
    @RequestMapping(value = "codeList")
    public String codeList(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {

        int totalCnt = service.selectOneCount(vo);
        vo.setParamsPaging(totalCnt);

        List<Code> list = service.selectList(vo);

        model.addAttribute("list", list);
        model.addAttribute("totalCnt", totalCnt);

        return "infra/code/xdmin/codeList";
    }

    /**
     * 공통코드 등록폼
     * 
     * @param model
     * @param vo
     * @return codeForm.jsp
     * @throws Exception
     */
    @RequestMapping(value = "codeForm")
    public String codeForm(@ModelAttribute("vo") CodeVo vo, Code dto, Model model) throws Exception {
        List<Code> list = service.selectCodeGroupName();

        model.addAttribute("list", list);

        return "infra/code/xdmin/codeForm";
    }

    /**
     * 공통코드 등록 함수
     * 
     * @param dto
     * @return codeList 리다이렉트
     * @throws Exception
     */
    @RequestMapping(value = "codeInst")
    public String codeInst(CodeVo vo, Code dto, RedirectAttributes redirectAttributes) throws Exception {
        service.insert(dto);

        vo.setMainKey(dto.getIfccSeq());

        redirectAttributes.addFlashAttribute("vo", vo);

        return "redirect:codeView";
    }

    /**
     * 공통코드 상세화면
     * 
     * @param model
     * @param dto
     * @return codeForm.jsp
     * @throws Exception
     */
    @RequestMapping(value = "codeView")
    public String codeView(@ModelAttribute("vo") CodeVo vo, Model model, Code dto) throws Exception {
        Code item = service.selectOne(vo);
        List<Code> list = service.selectCodeGroupName();

        model.addAttribute("item", item);
        model.addAttribute("list", list);

        return "infra/code/xdmin/codeForm";
    }

    /**
     * 공통코드 수정 함수
     * 
     * @param dto
     * @return codeList 리다이렉션
     * @throws Exception
     */
    @RequestMapping(value = "codeUpdt")
    public String codeUpdt(Code dto) throws Exception {
        int result = service.update(dto);
        System.out.println("ifcgSeq : " + dto.getIfcgSeq());
        System.out.println("ifccSeq : " + dto.getIfccSeq());
        System.out.println("controller result : " + result);
        return "redirect:codeList";
    }

    /**
     * 공통코드 삭제 함수(uelete)
     * 
     * @param dto
     * @return codeList 리다이렉션
     * @throws Exception
     */
    @RequestMapping(value = "codeUele")
    public String codeUele(Code dto) throws Exception {
        int result = service.uelete(dto);
        System.out.println("controller result22 : " + result);
        return "redirect:codeList";
    }

    @RequestMapping(value = "itemList")
    public String itemList(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {

        int totalCnt = service.selectOneCount(vo);
        vo.setParamsPaging(totalCnt);

        List<Code> list = service.selectItemList(vo);

        model.addAttribute("list", list);
        model.addAttribute("totalCnt", totalCnt);

        return "infra/item/xdmin/itemList";
    }

    @RequestMapping(value = "index")
    public String indexList(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {
        
        int totalCnt = service.selectVisitListCnt(vo);
        vo.setParamsPaging(totalCnt);
        
        Code item = service.selectItem();
        List<Code> itemList = service.selectIndexItem();
        List<Code> visitList = service.selectVisitList(vo);
        
        model.addAttribute("item", item);
        model.addAttribute("itemList", itemList);
        model.addAttribute("visitList", visitList);
        
        return "infra/code/xdmin/xdminIndex";
    }
    
    @RequestMapping(value = "indexAjaxLita")
    public String indexAjaxLita(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {
        
        int totalCnt = service.selectVisitListCnt(vo);
        vo.setParamsPaging(totalCnt);
        
        List<Code> visitList = service.selectVisitList(vo);
        model.addAttribute("visitList", visitList);
        
        return "infra/code/xdmin/xdminIndexLita";
    }
    
}
