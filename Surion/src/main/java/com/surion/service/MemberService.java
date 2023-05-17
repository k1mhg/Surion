package com.surion.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.surion.entity.Member;

public interface MemberService {
	public String join(Member m, RedirectAttributes rttr);
	public String findOne(Member m, HttpSession session, RedirectAttributes rttr);
	public String login(Member m, HttpSession session, RedirectAttributes rttr);

	public void logout(Member m, HttpSession session, RedirectAttributes rttr);
	public int check(Member m);
	public String updateProfile(HttpServletRequest requeset, HttpSession session, RedirectAttributes rttr);
	public Long findByMemberById(String id);

	Long findByMemberById(Long id);

    void save(Member member);
}
