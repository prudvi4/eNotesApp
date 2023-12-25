package com.enotes.user;

import java.util.Date;

public class PostDetails {
	private int id;
	private String title;
	private String content;
	private Date date;
	private UserDetails userDet;

	/**
	 * @param id
	 * @param title
	 * @param content
	 * @param date
	 * @param userDet
	 */
	public PostDetails(int id, String title, String content, Date date, UserDetails userDet) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.userDet = userDet;
	}

	/**
	 * 
	 */
	public PostDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}

	/**
	 * @return the userDet
	 */
	public UserDetails getUserDet() {
		return userDet;
	}

	/**
	 * @param userDet the userDet to set
	 */
	public void setUserDet(UserDetails userDet) {
		this.userDet = userDet;
	}

}
