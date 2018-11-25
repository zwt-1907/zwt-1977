package com.fh.shop.admin.biz.member;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.mapper.member.MemberDao;
import com.fh.shop.admin.po.Member;
import com.fh.shop.admin.util.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
    @Autowired
    private MemberDao memberDao;

    @Override
    public ServerResponse findMember(Member member, Integer draw) {
        DataTableResult data = new DataTableResult();
        int count = memberDao.memberCount(member);
        List<Member> memberList = memberDao.findMember(member);
        data.setDraw(draw);
        data.setiTotalRecords(count);
        data.setiTotalDisplayRecords(count);
        data.setData(memberList);
        return ServerResponse.success(data);
    }

    @Override
    public ServerResponse deleteMember(List<Integer> ids) {
        if (ids != null){
            memberDao.deleteMember(ids);
        }
        return ServerResponse.success();
    }

    @Override
    public ServerResponse toUpdateMember(Integer id) {
        Member memberList = memberDao.toUpdateMember(id);
        return ServerResponse.success(memberList);
    }

    @Override
    public ServerResponse updateMember(Member member) {
        System.out.println("+++++++++++++++++++++"+member);
        memberDao.updateMember(member);
        return ServerResponse.success();
    }
}
