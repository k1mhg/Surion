package com.surion.domain.repair;

import com.surion.domain.member.Mechanic;
import com.surion.domain.member.Member;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "Tsuri_repairitem")
public class RepairItem {

    @Id
    @GeneratedValue
    @Column(name = "repairitem_id")
    private Long id;

    private int orderPrice;
    private int count;

    @ManyToOne (fetch = FetchType.LAZY)
    @JoinColumn(name = "mechanic_id")
    private Mechanic mechanic;

    @ManyToOne (fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;
}
