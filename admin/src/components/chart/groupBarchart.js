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

// Register required Chart.js components
ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend);

const GroupedBarChart = ({ timeRange, type }) => {
  const [chartData, setChartData] = useState({ labels: [], datasets: [] });

  // Fetch data from the API
  const fetchStatisticsData = async () => {
    try {
      const response = await api.get(`/getRideStatistics?period=${timeRange}&type=${type}`);
      const { statistics } = response.data.data;

      if (type === "status") {
        // Handle `status` type
        const labels = Object.keys(statistics); // Extract periods (e.g., 2024-10, 2024-11)
        const statuses = ["completed", "canceled"]; // Chỉ lấy các trạng thái cần thiết

        const datasets = statuses.map(status => {
          return {
            label: status,
            data: labels.map(period => parseFloat(statistics[period][status] || 0)),
            backgroundColor: getColorForStatus(status),
            borderColor: getColorForStatus(status, true),
            borderWidth: 1,
          };
        });

        setChartData({
          labels,
          datasets,
        });
      } else {
        // Handle `vehicle_type` type or other types
        const labels = Object.keys(statistics); // Extract periods (e.g., 2024-10, 2024-11)
        const vehicleTypes = ["car-4", "car-7", "motorbike"];

        const datasets = vehicleTypes.map(vehicleType => {
          return {
            label: vehicleType,
            data: labels.map(period => parseFloat(statistics[period][vehicleType] || 0)),
            backgroundColor: getColorForVehicleType(vehicleType),
            borderColor: getColorForVehicleType(vehicleType, true),
            borderWidth: 1,
          };
        });

        setChartData({
          labels,
          datasets,
        });
      }
    } catch (error) {
      console.error("Error fetching statistics data:", error);
    }
  };

  // Helper function to get colors based on vehicle type
  const getColorForVehicleType = (vehicleType, isBorder = false) => {
    const colors = {
      "car-4": "rgba(75, 192, 192",
      "car-7": "rgba(153, 102, 255",
      "motorbike": "rgba(255, 159, 64",
      "null": "rgba(201, 203, 207",
    };
    return `${colors[vehicleType] || "rgba(100, 100, 100"}${isBorder ? ", 1)" : ", 0.5)"}`;
  };

  // Helper function to get colors based on status
  const getColorForStatus = (status, isBorder = false) => {
    const colors = {
      "completed": "rgba(75, 192, 192",
      "canceled": "rgba(255, 99, 132",
    };
    return `${colors[status] || "rgba(100, 100, 100"}${isBorder ? ", 1)" : ", 0.5)"}`;
  };

  // Fetch data when `timeRange` or `type` changes
  useEffect(() => {
    fetchStatisticsData();
  }, [timeRange, type]);

  // Chart options
  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: `Grouped Statistics (${timeRange === 'day' ? 'Daily' : timeRange === 'week' ? 'Weekly' : 'Monthly'})`,
      },
    },
    scales: {
      x: {
        stacked: false, // Các cột hiển thị cạnh nhau
      },
      y: {
        stacked: false, // Không chồng giá trị
      },
    },
  };

  return (
    <div>
      {chartData.labels.length > 0 ? (
        <Bar data={chartData} options={options} />
      ) : (
        <p className="text-center">Loading data...</p>
      )}
    </div>
  );
};

export default GroupedBarChart;
