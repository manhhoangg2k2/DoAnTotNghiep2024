import React, { useEffect, useState } from 'react';
import { Pie } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  ArcElement,
  Tooltip,
  Legend,
  Title,
} from 'chart.js';
import api from "../../utils/api"; // Import API

// Đăng ký các thành phần cần thiết của Chart.js
ChartJS.register(ArcElement, Tooltip, Legend, Title);

const PieChart = ({ timeRange, type }) => {
  const [chartData, setChartData] = useState(null);

  // Fetch data from the API
  const fetchStatisticsData = async () => {
    try {
      const response = await api.get(`/getRideStatistics?period=${timeRange}&type=${type}`);
      const { statistics } = response.data.data;

      // Lấy khoảng thời gian gần nhất
      const latestPeriod = Object.keys(statistics).sort().pop();
      const latestData = statistics[latestPeriod];

      // Tạo dữ liệu cho Pie Chart
      const labels = Object.keys(latestData); // Các trạng thái hoặc loại xe
      const data = labels.map(label => parseFloat(latestData[label] || 0)); // Dữ liệu tương ứng

      // Cập nhật chartData
      setChartData({
        labels,
        datasets: [
          {
            label: `Thống kê ${timeRange} gần nhất`,
            data,
            backgroundColor: ['#FF6384', '#FFCE56', '#36A2EB', '#4BC0C0'],
            hoverBackgroundColor: ['#FF6384', '#FFCE56', '#36A2EB', '#4BC0C0'],
            borderWidth: 1,
          },
        ],
      });
    } catch (error) {
      console.error("Error fetching statistics data:", error);
    }
  };

  // Fetch data when `timeRange` or `type` changes
  useEffect(() => {
    fetchStatisticsData();
  }, [timeRange, type]);

  // Tùy chỉnh Pie Chart
  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top', // Vị trí của chú thích (legend)
      },
      title: {
        display: true,
        text: `Biểu đồ Pie Chart (${timeRange === 'day' ? 'Ngày' : timeRange === 'month' ? 'Tháng' : 'Năm'} gần nhất)`,
      },
    },
  };

  return (
    <div style={{ width: '400px', margin: 'auto' }}>
      {chartData ? (
        <Pie data={chartData} options={options} />
      ) : (
        <p className="text-center">Đang tải dữ liệu...</p>
      )}
    </div>
  );
};

export default PieChart;
