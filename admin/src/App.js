import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Sidebar from './components/sideBar';
import Login from './components/login';
import ForgotPassword from './components/forgotPassword';
import AdminDashboard from './components/adminDashboard';
import CustomerManager from './components/customerManager';
import DriverManager from './components/driverManager';
import TransactionManager from './components/transactionManager';
import MapComponent from './components/driverLocationManager';

const App = () => {
  return (
    <Router>
      <Routes>
        {/* Các route không có Sidebar */}
        <Route path="/" element={<Login />} />
        <Route path="/forgot-password" element={<ForgotPassword />} />

        {/* Các route có Sidebar */}
        <Route
          path="/dashboard"
          element={
            <LayoutWithSidebar>
              <AdminDashboard />
            </LayoutWithSidebar>
          }
        />
        <Route
          path="/customerManager"
          element={
            <LayoutWithSidebar>
              <CustomerManager />
            </LayoutWithSidebar>
          }
        />

        <Route
          path="/driverManager"
          element={
            <LayoutWithSidebar>
              <DriverManager />
            </LayoutWithSidebar>
          }
        />

        <Route
          path="/transactionManager"
          element={
            <LayoutWithSidebar>
              <TransactionManager />
            </LayoutWithSidebar>
          }
        />

        <Route
          path="/driverLocationManager"
          element={
            <LayoutWithSidebar>
              <MapComponent />
            </LayoutWithSidebar>
          }
        />
      </Routes>
    </Router>
  );
};

// Layout bao gồm Sidebar
const LayoutWithSidebar = ({ children }) => {
  return (
    <div style={{ display: 'flex' }}>
      <Sidebar />
      <div style={{ marginLeft: '250px', padding: '20px', width: '100%' }}>
        {children}
      </div>
    </div>
  );
};

export default App;
