import React, { useEffect, useState } from 'react';
import { Bar } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';
import api from "../../utils/api"; // Import API

// Đăng ký các thành phần bắt buộc của Chart.js
ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend);

const BarChart = ({ timeRange }) => {
  const [chartData, setChartData] = useState({ labels: [], datasets: [] });

  // Gọi API để lấy dữ liệu
  const fetchRevenueData = async () => {
    try {
      const response = await api.get(`/getRevenueStatistics?type=${timeRange}`);
      const { revenue } = response.data.data;

      // Chuyển đổi dữ liệu từ API thành định dạng phù hợp với Chart.js
      const labels = revenue.map(item => item.period); // period là các khoảng thời gian
      const revenueData = revenue.map(item => parseFloat(item.total_revenue)); // total_revenue là doanh thu

      setChartData({
        labels,
        datasets: [
          {
            label: 'Doanh thu (VNĐ)',
            data: revenueData,
            backgroundColor: 'rgba(75, 192, 192, 0.5)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1,
          },
        ],
      });
    } catch (error) {
      console.error("Lỗi khi gọi API:", error);
    }
  };

  // Gọi API khi `timeRange` thay đổi
  useEffect(() => {
    fetchRevenueData();
  }, [timeRange]);

  // Tùy chỉnh biểu đồ
  const options = {
    responsive: true,
    maintainAspectRatio: false, // Tắt để cho phép tùy chỉnh kích thước
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: `Biểu đồ Doanh thu (${timeRange === 'day' ? 'Ngày' : timeRange === 'week' ? 'Tuần' : 'Tháng'})`,
      },
    },
  };

  return (
    <div style={{ width: '100%', height: '500px' }}> {/* Thay đổi kích thước container */}
      {chartData.labels.length > 0 ? (
        <Bar data={chartData} options={options} />
      ) : (
        <p className="text-center">Đang tải dữ liệu...</p>
      )}
    </div>
  );
};

export default BarChart;
