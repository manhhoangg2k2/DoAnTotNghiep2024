import React from 'react';
import { Link } from 'react-router-dom';

const Sidebar = () => {
  return (
    <div style={styles.sidebar}>
      <h2 style={styles.header}>Quản lý</h2>
      <ul style={styles.menu}>
        <li style={styles.menuItem}>
          <Link to="/dashboard" style={styles.link}>Tổng quát</Link>
        </li>
        <li style={styles.menuItem}>
          <Link to="/customerManager" style={styles.link}>Quản lý khách hàng</Link>
        </li>
        <li style={styles.menuItem}>
          <Link to="/driverManager" style={styles.link}>Quản lý tài xế</Link>
        </li>
        <li style={styles.menuItem}>
          <Link to="/transactionManager" style={styles.link}>Quản lý giao dịch</Link>
        </li>
        <li style={styles.menuItem}>
          <Link to="/driverLocationManager" style={styles.link}>Quản lý vị trí tài xế</Link>
        </li>
      </ul>
    </div>
  );
};

const styles = {
  sidebar: {
    width: '250px',
    height: '100vh',
    backgroundColor: '#333',
    color: '#fff',
    position: 'fixed',
    top: 0,
    left: 0,
    padding: '20px',
    boxSizing: 'border-box',
  },
  header: {
    marginBottom: '20px',
    fontSize: '18px',
    fontWeight: 'bold',
  },
  menu: {
    listStyleType: 'none',
    padding: 0,
  },
  menuItem: {
    marginBottom: '10px',
  },
  link: {
    color: '#fff',
    textDecoration: 'none',
    fontSize: '16px',
  },
};

export default Sidebar;
