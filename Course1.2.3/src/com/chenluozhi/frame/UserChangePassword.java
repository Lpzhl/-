package com.chenluozhi.frame;
import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JDialog;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JLabel;
import java.awt.*;
import javax.swing.JPasswordField;
import javax.swing.JButton;

import com.chenluozhi.dao.UserDao;
import com.chenluozhi.util.DBConnection;

public class UserChangePassword extends JDialog{
	private static final long serialVersionUID = 1L;
	private JPanel jContentPane = null;
	private JLabel jLabel = null;
	private JLabel jLabel1 = null;
	private JLabel jLabel2 = null;
	private JPasswordField jPasswordField_old = null;
	private JPasswordField jPasswordField_new1 = null;
	private JPasswordField jPasswordField_new2 = null;
	private JButton jButton = null;
	private JButton jButton1 = null;
	
	
	ImageIcon icon0 = new ImageIcon(getClass().getResource("../images/male.gif"));
	ImageIcon icon1 = new ImageIcon(getClass().getResource("../images/female.gif"));
	/**
	 * 构造函数模块
	 */
	public UserChangePassword() {
		super();
		initialize();
	}

	private void initialize() {
		this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		this.setSize(245, 229);
		this.setContentPane(getJContentPane());
		this.setModal(true);
		this.setLocationRelativeTo(null);
		this.setTitle("修改密码");
	}
	/**
	 * 获取面板内容模块
	 */
	private JPanel getJContentPane() {
		if (jContentPane == null) {
			jContentPane = new JPanel();
			jContentPane.setLayout(new GridLayout(8, 6, 5, 5));

			jLabel = new JLabel("旧密码：");
			jContentPane.add(jLabel);
			jContentPane.add(getJPasswordField_old());

			jLabel1 = new JLabel("新密码：");
			jContentPane.add(jLabel1);
			jContentPane.add(getJPasswordField_new1());

			jLabel2 = new JLabel("确认密码：");
			jContentPane.add(jLabel2);
			jContentPane.add(getJPasswordField_new2());

			jContentPane.add(getJButton());
			jContentPane.add(getJButton1());
		}
		return jContentPane;
	}

	private JPasswordField getJPasswordField_old() {
		if (jPasswordField_old == null) {
			jPasswordField_old = new JPasswordField();
		}
		return jPasswordField_old;
	}

	private JPasswordField getJPasswordField_new1() {
		if (jPasswordField_new1 == null) {
			jPasswordField_new1 = new JPasswordField();
		}
		return jPasswordField_new1;
	}

	private JPasswordField getJPasswordField_new2() {
		if (jPasswordField_new2 == null) {
			jPasswordField_new2 = new JPasswordField();
		}
		return jPasswordField_new2;
	}

	private JButton getJButton() {
		if (jButton == null) {
			jButton = new JButton("确定");
			jButton.addActionListener(new java.awt.event.ActionListener() {
				public void actionPerformed(java.awt.event.ActionEvent e) {
					UserDao ud = new UserDao();
					String old = new String(getJPasswordField_old().getPassword());
					String new1 = new String(getJPasswordField_new1().getPassword());
					String new2 = new String(getJPasswordField_new2().getPassword());

					if (old.equals(Login.storeUserPassword)) {
						if (new1.equals(new2)) {
							ud.changeUserPassword(0, Login.storeUserName, Login.storeUserPassword, new1);
							JOptionPane.showMessageDialog(null, null, "密码修改成功",
									JOptionPane.INFORMATION_MESSAGE, icon0);
							Login.storeUserPassword = new1;//把改好的密码写回去。
							dispose();
						} else {
							JOptionPane.showMessageDialog(null,
									"请您重新确定两次新密码输入，请重新输入！", "系统提示",
									JOptionPane.ERROR_MESSAGE);
							return;
						}
					} else {
						JOptionPane.showMessageDialog(null, "请修改", "旧密码不正确",
								JOptionPane.INFORMATION_MESSAGE, icon1);
						return;
					}
				}
			});
		}
		return jButton;
	}

	private JButton getJButton1() {
		if (jButton1 == null) {
			jButton1 = new JButton("取消");
			jButton1.addActionListener(new java.awt.event.ActionListener() {
				public void actionPerformed(java.awt.event.ActionEvent e) {
					dispose();
				}
			});
		}
		return jButton1;
	}


} 
