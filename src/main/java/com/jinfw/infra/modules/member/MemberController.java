package com.jinfw.infra.modules.member;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jinfw.infra.modules.code.Code;
import com.jinfw.infra.modules.code.CodeVo;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {

    @Autowired
    MemberServiceImpl service;

    @RequestMapping(value = "login")
    public String login() throws Exception {

        return "infra/member/xdmin/loginForm";
    }

    /**
     * member/memberList 접속시 실행되는 함수
     * 
     * @param model
     * @param vo
     * @return memberList.jsp
     * @throws Exception
     */
    @RequestMapping(value = "memberList")
    public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {

        vo.setParamsPaging(service.selectOneCount(vo));
        List<Member> list = service.selectList(vo);
        model.addAttribute("list", list);

        return "infra/member/xdmin/memberAjaxList";
    }
    
    @RequestMapping(value = "memberAjaxList")
    public String memberAjaxList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {

        return "infra/member/xdmin/memberAjaxList";
    }
    
    @RequestMapping(value = "memberAjaxLita")
    public String memberAjaxLita(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {

        vo.setParamsPaging(service.selectOneCount(vo));
        List<Member> list = service.selectList(vo);
        model.addAttribute("list", list);

        return "infra/member/xdmin/memberAjaxLita";
    }

    @RequestMapping(value = "memberForm")
    public String codeForm(@ModelAttribute("vo") CodeVo vo, Code dto, Model model) throws Exception {

        return "infra/member/xdmin/memberForm";
    }

    @RequestMapping("excelDownload")
    public void excelDownload(MemberVo vo, HttpServletResponse httpServletResponse) throws Exception {

        vo.setParamsPaging(service.selectOneCount(vo));

        if (vo.getTotalRows() > 0) {
            List<Member> list = service.selectList(vo);

//          Workbook workbook = new HSSFWorkbook(); // for xls
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("Sheet1");
            CellStyle cellStyle = workbook.createCellStyle();
            Row row = null;
            Cell cell = null;
            int rowNum = 0;

//          each column width setting           
            sheet.setColumnWidth(0, 2100);
            sheet.setColumnWidth(1, 3100);

//          Header
            String[] tableHeader = { "Seq", "아이디", "이름", "이메일", "모바일", "등록장소", "등록일", "수정일" };

            row = sheet.createRow(rowNum++);

            for (int i = 0; i < tableHeader.length; i++) {
                cell = row.createCell(i);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(tableHeader[i]);
            }

//          Body
            for (int i = 0; i < list.size(); i++) {
                row = sheet.createRow(rowNum++);

//              String type: null 전달 되어도 ok
//              int, date type: null 시 오류 발생 하므로 null check
//              String type 이지만 정수형 데이터가 전체인 seq 의 경우 캐스팅               

                cell = row.createCell(0);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(Integer.parseInt(list.get(i).getSeq()));

                cell = row.createCell(1);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getMemberID());

                cell = row.createCell(2);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getMemberName());

                cell = row.createCell(3);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                // if(list.get(i).getIfmmGenderCd() != null)
                // cell.setCellValue(CodeServiceImpl.selectOneCachedCode(list.get(i).getIfmmGenderCd()));
                cell.setCellValue(list.get(i).getMemberMailName() + '@' + list.get(i).getMemberMailDomain());

                cell = row.createCell(4);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getMemberMobile());

                cell = row.createCell(5);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getMemberPlace());

                cell = row.createCell(6);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getMemberSignDatetime());

                cell = row.createCell(7);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getMemberModDatetime());

            }

            httpServletResponse.setContentType("ms-vnd/excel");
//          httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");    // for xls
            httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

            workbook.write(httpServletResponse.getOutputStream());
            workbook.close();
        }
    }
}
