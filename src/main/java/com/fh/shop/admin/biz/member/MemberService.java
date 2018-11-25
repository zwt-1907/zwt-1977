package com.fh.shop.admin.biz.member;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.Member;

import java.util.List;

public interface MemberService {
    ServerResponse findMember(Member member, Integer draw);

    ServerResponse deleteMember(List<Integer> ids);

    ServerResponse toUpdateMember(Integer id);

    ServerResponse updateMember(Member member);
}
