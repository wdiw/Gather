package com.Gather.Sponsorship.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.Gather.Project.model.ProjectBean;
import com.Gather.member.entity.Member;

@Entity
@Table(name = "Favorite")
public class FavoriteBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer favorite;
	
	@ManyToOne(cascade = CascadeType.PERSIST,fetch = FetchType.LAZY)
	@JoinColumn(name = "mID")
	Member member;
	
	@ManyToOne(cascade = CascadeType.PERSIST,fetch = FetchType.LAZY)
	@JoinColumn(name = "pID")
	ProjectBean projectBean;

	
	
	public FavoriteBean() {
	}

	

	public FavoriteBean(Integer favorite, Member member, ProjectBean projectBean) {
		super();
		this.favorite = favorite;
		this.member = member;
		this.projectBean = projectBean;
	}


	public Integer getFavorite() {
		return favorite;
	}

	public void setFavorite(Integer favorite) {
		this.favorite = favorite;
	}



	public Member getMember() {
		return member;
	}



	public void setMember(Member member) {
		this.member = member;
	}



	public ProjectBean getProjectBean() {
		return projectBean;
	}



	public void setProjectBean(ProjectBean projectBean) {
		this.projectBean = projectBean;
	}

	

}
