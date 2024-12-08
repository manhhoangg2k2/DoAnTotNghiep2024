import React, { useState, useEffect } from "react";
import api from "../utils/api";
import Table from "react-bootstrap/Table";
import Button from "react-bootstrap/Button";
import Badge from "react-bootstrap/Badge";

const TransactionManager = () => {
  const [transactions, setTransactions] = useState([]);
  const [loading, setLoading] = useState(true);

  const fetchTransactions = async () => {
    setLoading(true);
    try {
      const response = await api.get("/getListTransaction");
      setTransactions(response.data.data.reverse()); // Đảo ngược danh sách
    } catch (error) {
      console.error("Error fetching transactions:", error);
    } finally {
      setLoading(false);
    }
  };

  const handleAcceptTransaction = async (transactionId) => {
    try {
      await api.put(`/acceptTransaction/${transactionId}`);
      fetchTransactions();
      alert("Giao dịch đã được chấp nhận!");
    } catch (error) {
      console.error("Error accepting transaction:", error);
      alert("Lỗi khi chấp nhận giao dịch!");
    }
  };

  const handleCancelTransaction = async (transactionId) => {
    try {
      await api.put(`/cancelTransaction/${transactionId}`);
      fetchTransactions();
      alert("Giao dịch đã bị hủy!");
    } catch (error) {
      console.error("Error cancelling transaction:", error);
      alert("Lỗi khi hủy giao dịch!");
    }
  };

  const formatCurrency = (amount) => {
    return new Intl.NumberFormat("vi-VN", {
      style: "currency",
      currency: "VND",
    }).format(amount);
  };

  useEffect(() => {
    fetchTransactions();
  }, []);

  return (
    <div>
      <h1>
        <Badge bg="secondary">Quản lý giao dịch</Badge>
      </h1>
      <Table striped bordered>
        <thead>
          <tr>
            <th>STT</th>
            <th>Mã giao dịch</th>
            <th>Loại giao dịch</th>
            <th>Số tiền</th>
            <th>Thời gian tạo</th>
            <th>Trạng thái</th>
            <th>Lời nhắn</th>
            <th>Hành động</th>
          </tr>
        </thead>
        <tbody>
          {transactions.map((transaction, index) => (
            <tr
              key={transaction.id}
              style={{
                backgroundColor:
                  transaction.status === "inProcess"
                    ? "rgba(255, 193, 7, 0.2)" // Vàng nhạt
                    : transaction.status === "success"
                    ? "rgba(40, 167, 69, 0.2)" // Xanh lá nhạt
                    : "rgba(220, 53, 69, 0.2)", // Đỏ nhạt
              }}
            >
              <td>{index + 1}</td>
              <td>{transaction.id}</td>
              <td>
                {transaction.transaction_type === "deposit"
                  ? "Nạp tiền"
                  : "Rút tiền"}
              </td>
              <td>{formatCurrency(transaction.amount)}</td>
              <td>{new Date(transaction.created_time).toLocaleString()}</td>
              <td>
                <Badge
                  bg={
                    transaction.status === "inProcess"
                      ? "warning"
                      : transaction.status === "success"
                      ? "success"
                      : "danger"
                  }
                >
                  {transaction.status === "inProcess"
                    ? "Đang xử lý"
                    : transaction.status === "success"
                    ? "Thành công"
                    : "Đã hủy"}
                </Badge>
              </td>
              <td>{transaction.description}</td>
              <td>
                {transaction.status === "inProcess" && (
                  <div style={{ display: "flex", gap: "10px" }}>
                    <Button
                      variant="success"
                      onClick={() => handleAcceptTransaction(transaction.id)}
                    >
                      Chấp nhận
                    </Button>
                    <Button
                      variant="danger"
                      onClick={() => handleCancelTransaction(transaction.id)}
                    >
                      Hủy bỏ
                    </Button>
                  </div>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
    </div>
  );
};

export default TransactionManager;
