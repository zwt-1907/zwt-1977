package com.fh.shop.admin.controller.member;

import com.fh.shop.admin.annotation.LogAnnotation;
import com.fh.shop.admin.biz.member.MemberService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.Member;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("member")
public class MemberController {
    @Resource
    private MemberService memberService;

    @RequestMapping("jumpMember")
    @LogAnnotation("进入会员列表页面")
    public String jumpMember(){
        return "member/memberList";
    }

    //查询会员列表
    @RequestMapping("/findMember")
    @LogAnnotation("进入会员列表页面")
    @ResponseBody
    public ServerResponse findMember(Member member,Integer draw){
        return memberService.findMember(member,draw);
    }
    //删除
    @RequestMapping("/deleteMember")
    @LogAnnotation("进入会员列表页面")
    @ResponseBody
    public ServerResponse deleteMember(@RequestParam(value = "ids[]")List<Integer> ids){
        return memberService.deleteMember(ids);
    }

    //回显
    @RequestMapping("/toUpdateMember")
    @LogAnnotation("进入会员列表页面")
    @ResponseBody
    public ServerResponse toUpdateMember(Integer id){
        return memberService.toUpdateMember(id);
    }

    //修改
    @RequestMapping("/updateMember")
    @LogAnnotation("进入会员列表页面")
    @ResponseBody
    public ServerResponse updateMember(Member member){
        System.out.println("000000000000000000000000000."+member);
        return memberService.updateMember(member);
    }
}
