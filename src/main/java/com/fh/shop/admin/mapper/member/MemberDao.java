package com.fh.shop.admin.mapper.member;

import com.fh.shop.admin.po.Member;

import java.util.List;

public interface MemberDao {
    int memberCount(Member member);

    List<Member> findMember(Member member);

    void deleteMember(List<Integer> ids);

    Member toUpdateMember(Integer id);

    void updateMember(Member member);
}
