package com.enotes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.enotes.user.PostDetails;

public class PostDAO {
	private Connection conn;

	/**
	 * @param conn
	 */
	public PostDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addNotes(String title, String content, int uid) {
		boolean addRegNoteFlag = false;
		String INST_QRY = "INSERT INTO enotes_app.post(title,content,uid) VALUES(?,?,?)";
		try {
			PreparedStatement pst = conn.prepareStatement(INST_QRY);
			pst.setString(1, title);
			pst.setString(2, content);
			pst.setInt(3, uid);

			int rowsAffected = pst.executeUpdate();

			if (rowsAffected == 1) {
				addRegNoteFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return addRegNoteFlag;
	}

	public List<PostDetails> getPostData(int id) {
		List<PostDetails> postDetList = new ArrayList<PostDetails>();
		PostDetails post = null;
		String GET_POST_QRY = "SELECT * FROM enotes_app.post WHERE uid=? ORDER BY id DESC";
		try {
			PreparedStatement pst = conn.prepareStatement(GET_POST_QRY);
			pst.setInt(1, id);
			ResultSet resultSet = pst.executeQuery();
			while (resultSet.next()) {
				post = new PostDetails();
				post.setId(resultSet.getInt(1));
				post.setTitle(resultSet.getString(2));
				post.setContent(resultSet.getString(3));
				post.setDate(resultSet.getTimestamp(4));
				postDetList.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return postDetList;
	}

	public PostDetails getDataById(int noteId) {
		PostDetails post = null;
		String GET_QRY = "SELECT * FROM enotes_app.post WHERE id=?";

		try {
			PreparedStatement pst = conn.prepareStatement(GET_QRY);
			pst.setInt(1, noteId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				post = new PostDetails();
				post.setId(rs.getInt(1));
				post.setTitle(rs.getString(2));
				post.setContent(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}

	public boolean postUpdate(int nid, String tit, String con) {
		boolean postUpFlag = false;
		String UPD_QRY = "UPDATE enotes_app.post SET title=?,content=? WHERE id=?";
		try {
			PreparedStatement pst = conn.prepareStatement(UPD_QRY);
			pst.setString(1, tit);
			pst.setString(2, con);
			pst.setInt(3, nid);
			int rows = pst.executeUpdate();
			if (rows == 1) {
				postUpFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return postUpFlag;
	}

	public boolean postDelete(int id) {
		boolean pstDelFlag = false;
		String DEL_QRY = "DELETE FROM enotes_app.post WHERE id=?";
		try {
			PreparedStatement pst = conn.prepareStatement(DEL_QRY);
			pst.setInt(1, id);
			int rowsAff = pst.executeUpdate();
			if (rowsAff == 1) {
				pstDelFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pstDelFlag;
	}

}
