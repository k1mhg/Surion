package com.surion.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.ui.Model;

import com.surion.entity.RepairForm;
import com.surion.entity.RepairListPaging;
import com.surion.entity.RepairOffer;

import lombok.Delegate;

@Mapper
public interface RepairFormRepository{
	
	// 寃ъ�� �� ����
	@Insert("Insert into suri_repairForm VALUES ("
			+ " null, #{member_id}, #{choice1}, #{choice2}, #{deliveryType}, "
			+ "#{date}, #{image}, #{title}, #{content}, #{estimate}, #{itemcategory_id}, 0)")
	public void save(RepairForm m);

	// RepairList ���댁����� 肉�由ш린
	@Select("select * from suri_repairForm order by idx desc LIMIT #{startValue}, #{perPageNum}")
	public List<RepairForm> findByAll(RepairListPaging pa);
	
	// RepairList ��泥� �レ�� 移댁�댄��
	@Select("select count(*) from suri_repairForm")
	public int findByCount();
	
	// RepairDetail ���몃낫湲�
	@Select("select * from suri_repairForm where idx = #{idx}")
	public RepairForm findById(RepairForm m);
	
	// RepairList 議고���� 利�媛�
	@Update("update suri_repairForm set readCount = readCount +1 where idx = #{idx}")
	public void increaseCount(RepairForm m);
	
	// RepairList 寃���
	@Select("select * from suri_repairForm where title LIKE CONCAT ('%',#{keyword},'%') LIMIT #{startValue}, #{perPageNum}")
	public List<RepairForm> search(RepairListPaging pa);
	
	// 寃��� ��泥� �レ�� 移댁�댄��
	@Select("select count(*) from suri_repairForm where title LIKE CONCAT ('%',#{keyword},'%')")
	public int searchCount(RepairListPaging pa);
	
	// 留��댄���댁��� 寃���
	@Select("select * from suri_repairForm where member_id = #{member_id}")
	public List<RepairForm> findByMemberId(@Param("member_id") String id);
	
	// 留��댄���댁��� ����
	@Update("update suri_repairForm set image = #{image}, date = #{date}, title = #{title}, "
			+ "content = #{content}, estimate=#{estimate} where idx = #{idx}")
	public void updateRepair(RepairForm repairForm);
	
	// ��猶� 紐⑸� ����
	@Delete("delete from suri_repairForm where idx = #{idx}")
	public void deleteRepair(RepairForm repairForm);

	
	// ��猶� 紐⑸����� Mechanic�� ��猶� ����
	@Insert("insert into suri_repairOffer(mechanic_id, member_id, estimate) values(#{mechanic_id}, #{member_id}, #{estimate})")
	public void offer(RepairOffer offer);
	
	
//	Ajax Sql ----------------------------------
	
	// Ajax濡� 移댄��怨�由� ����
	@Select("select * from suri_repairForm where itemcategory_id = #{kind}")
	public List<RepairForm> category(int kind); 
	// 理�����
	@Select("select * from suri_repairForm order by idx desc")
	public List<RepairForm> categoryRecent(int kind); 
	// �멸린��
	@Select("select * from suri_repairForm order by readCount desc")
	public List<RepairForm> categoryPopular(int kind); 
	
	
// ---------------------------------------------
}