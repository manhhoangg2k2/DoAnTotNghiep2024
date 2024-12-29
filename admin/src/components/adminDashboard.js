import React, { useState, useEffect } from 'react';
import BarChart from '../components/chart/barchart';
import PieChart from './chart/piechart';
import GroupedBarChart from './chart/groupBarchart';
import api from "../utils/api";

const chartContainerLarge = {
  flex: 5,
  margin: '10px',
  padding: '10px',
  backgroundColor: '#f2f2f2',
  boxShadow: '0px 4px 6px rgba(0, 0, 0, 0.1)',
  borderRadius: '8px',
};

const chartContainerSmall = {
  flex: 1,
  margin: '10px',
  maxWidth: '48%',
  padding: '10px',
  backgroundColor: '#f2f2f2',
  boxShadow: '0px 4px 6px rgba(0, 0, 0, 0.1)',
  borderRadius: '8px',
};

const tableContainer = {
  flex: 5,
  margin: '10px',
  padding: '10px',
  backgroundColor: '#f2f2f2',
  boxShadow: '0px 4px 6px rgba(0, 0, 0, 0.1)',
  borderRadius: '8px',
};

const AdminDashboard = () => {
  const [timeRange, setTimeRange] = useState('month'); 
  const [type, setType] = useState('vehicle_type'); 
  const [drivers, setDrivers] = useState([]); 
  const [loading, setLoading] = useState(true);

  const handleTimeRangeChange = (event) => {
    setTimeRange(event.target.value);
  };

  const handleTypeChange = (event) => {
    setType(event.target.value);
  };

  const fetchDrivers = async () => {
    setLoading(true);
    try {
      const response = await api.get("/getRankingDriver");
      setDrivers(response.data.data.drivers || []);
    } catch (error) {
      console.error("Error fetching drivers:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchDrivers();
  }, []);

  return (
    <div className="container mt-5">
      <header className="text-center mb-4">
        <h1 className="display-4">Thống kê</h1>
        <p className="lead">Thống kê doanh thu và số lượng chuyến xe</p>
      </header>

      <div className="text-center mb-4">
        <label htmlFor="timeRange" className="form-label me-2">
          Thống kê theo:
        </label>
        <select
          id="timeRange"
          className="form-select d-inline-block w-auto"
          value={timeRange}
          onChange={handleTimeRangeChange}
        >
          <option value="day">Theo ngày</option>
          <option value="month">Theo tháng</option>
          <option value="year">Theo năm</option>
        </select>

        <select
          id="type"
          className="form-select d-inline-block w-auto"
          value={type}
          onChange={handleTypeChange}
        >
          <option value="vehicle_type">Theo loại xe</option>
          <option value="status">Theo trạng thái</option>
        </select>
      </div>

      <div style={{ display: 'flex', flexWrap: 'wrap', gap: '20px' }}>
        <div style={chartContainerLarge}>
          <h2 className="text-center text-primary">Biểu đồ Doanh thu</h2>
          <BarChart timeRange={timeRange} />
        </div>

        <div style={tableContainer}>
          <h2 className="text-center text-info">Bảng xếp hạng</h2>
          {loading ? (
            <div className="text-center">Đang tải...</div>
          ) : (
            <table className="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Số thứ tự</th>
                  <th>Tên tài xế</th>
                  <th>Tích cực</th>
                  <th>Tiêu cực</th>
                  <th>Đánh giá</th>
                </tr>
              </thead>
              <tbody>
                {drivers.length > 0 ? (
                  drivers.map((driver, index) => (
                    <tr key={driver.id}>
                      <td>{index + 1}</td>
                      <td>{driver.name}</td>
                      <td>{driver.posCount}</td>
                      <td>{driver.negCount}</td>
                      <td>{driver.rating} ⭐</td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan="5" className="text-center">
                      Không có dữ liệu
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          )}
        </div>
      </div>

      <div style={{ display: 'flex', justifyContent: 'space-between', flexWrap: 'wrap', gap: '20px' }}>
        <div style={chartContainerSmall}>
          <h2 className="text-center text-success">Biểu đồ Phân phối</h2>
          <PieChart timeRange={timeRange} type={type} />
        </div>

        <div style={chartContainerSmall}>
          <h2 className="text-center text-warning">Biểu đồ Phân nhóm</h2>
          <GroupedBarChart timeRange={timeRange} type={type} />
        </div>
      </div>
    </div>
  );
};

export default AdminDashboard;
