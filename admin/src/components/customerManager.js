import React, { useState, useEffect } from "react";
import api from "../utils/api";
import Table from "react-bootstrap/Table";
import Button from "react-bootstrap/Button";
import Badge from "react-bootstrap/Badge";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import Alert from "react-bootstrap/Alert";

const CustomerTable = () => {
  const [customers, setCustomers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showAddEditModal, setShowAddEditModal] = useState(false);
  const [showDeleteModal, setShowDeleteModal] = useState(false);

  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [phoneNumber, setPhoneNumber] = useState("");
  const [selectedGender, setSelectedGender] = useState("");
  const [customerIdToEdit, setCustomerIdToEdit] = useState(null);
  const [canDelete, setCanDelete] = useState(false); // Checkbox trạng thái

  const [errors, setErrors] = useState({});

  // Validate form
  const validateForm = () => {
    const newErrors = {};
    if (!name.trim()) newErrors.name = "Tên không được để trống.";
    if (!email.trim()) {
      newErrors.email = "Email không được để trống.";
    } else if (!/\S+@\S+\.\S+/.test(email)) {
      newErrors.email = "Email không hợp lệ.";
    }
    if (!phoneNumber.trim()) {
      newErrors.phoneNumber = "Số điện thoại không được để trống.";
    } else if (!/^\d{10}$/.test(phoneNumber)) {
      newErrors.phoneNumber = "Số điện thoại phải là 10 chữ số.";
    }
    if (!selectedGender) newErrors.gender = "Hãy chọn giới tính.";
    return newErrors;
  };

  // Fetch customers
  const fetchCustomers = async () => {
    setLoading(true);
    try {
      const response = await api.get("/getListCustomer");
      setCustomers(response.data.data.customers);
    } catch (error) {
      console.error("Error fetching customers:", error);
    } finally {
      setLoading(false);
    }
  };

  // Add or Edit Customer
  const handleSubmit = async () => {
    const newErrors = validateForm();
    if (Object.keys(newErrors).length > 0) {
      setErrors(newErrors);
      return;
    }

    try {
      if (customerIdToEdit) {
        const id = customerIdToEdit
        await api.put(`/updateCustomerInfo`, {
          id,
          name,
          email,
          phoneNumber,
          gender: selectedGender,
        });
      } else {
        await api.post("/addNewCustomer", {
          name,
          email,
          phoneNumber,
          gender: selectedGender,
          created_time: new Date().toISOString(),
        });
      }
      setShowAddEditModal(false);
      fetchCustomers();
    } catch (error) {
      console.error("Error saving customer:", error);
    }
  };

  // Delete customer
  const handleDelete = async () => {
    if (!canDelete) return; // Chỉ xóa nếu đã tích checkbox
    try {
      await api.delete(`/deleteCustomer/${customerIdToEdit}`);
      setShowDeleteModal(false);
      fetchCustomers();
    } catch (error) {
      console.error("Error deleting customer:", error);
    }
  };

  const handleCloseAddEditModal = () => {
    setShowAddEditModal(false);
    setName("");
    setEmail("");
    setPhoneNumber("");
    setSelectedGender("");
    setCustomerIdToEdit(null);
    setErrors({});
  };

  const handleCloseDeleteModal = () => {
    setShowDeleteModal(false);
    setCustomerIdToEdit(null);
    setCanDelete(false);
    setCanDelete(false);
  };

  const handleShowAddEditModal = (customer) => {
    if (customer) {
      setName(customer.name);
      setEmail(customer.email);
      setPhoneNumber(customer.phone_number);
      setSelectedGender(customer.gender);
      setCustomerIdToEdit(customer.id);
    }
    setShowAddEditModal(true);
  };

  const handleShowDeleteModal = (customerId) => {
    setCustomerIdToEdit(customerId);
    setShowDeleteModal(true);
  };

  useEffect(() => {
    fetchCustomers();
  }, []);

  return (
    <div>
      <h1>
        <Badge bg="secondary">Quản lý khách hàng</Badge>
      </h1>
      <div style={{ marginBottom: "20px", textAlign: "right" }}>
        <Button variant="success" onClick={() => handleShowAddEditModal()}>
          Thêm người dùng
        </Button>
      </div>
      <Modal show={showAddEditModal} onHide={handleCloseAddEditModal}>
        <Modal.Header closeButton>
          <Modal.Title>{customerIdToEdit ? "Sửa người dùng" : "Thêm người dùng"}</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group className="mb-3" controlId="formName">
              <Form.Label>Tên</Form.Label>
              <Form.Control
                value={name}
                onChange={(e) => setName(e.target.value)}
                placeholder="Nguyễn Văn A"
                autoFocus
                isInvalid={!!errors.name}
              />
              <Form.Control.Feedback type="invalid">
                {errors.name}
              </Form.Control.Feedback>
            </Form.Group>
            <Form.Group className="mb-3" controlId="formEmail">
              <Form.Label>Email</Form.Label>
              <Form.Control
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                type="email"
                placeholder="name@example.com"
                isInvalid={!!errors.email}
              />
              <Form.Control.Feedback type="invalid">
                {errors.email}
              </Form.Control.Feedback>
            </Form.Group>
            <Form.Group className="mb-3" controlId="formPhoneNumber">
              <Form.Label>Số điện thoại</Form.Label>
              <Form.Control
                value={phoneNumber}
                onChange={(e) => setPhoneNumber(e.target.value)}
                placeholder="0123456789"
                isInvalid={!!errors.phoneNumber}
              />
              <Form.Control.Feedback type="invalid">
                {errors.phoneNumber}
              </Form.Control.Feedback>
            </Form.Group>
            <Form.Group controlId="genderDropdown">
              <Form.Label>Chọn giới tính</Form.Label>
              <Form.Select
                value={selectedGender}
                onChange={(e) => setSelectedGender(e.target.value)}
                isInvalid={!!errors.gender}
              >
                <option value="">Chọn...</option>
                <option value="Nam">Nam</option>
                <option value="Nữ">Nữ</option>
                <option value="Khác">Khác</option>
              </Form.Select>
              <Form.Control.Feedback type="invalid">
                {errors.gender}
              </Form.Control.Feedback>
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleCloseAddEditModal}>
            Quay lại
          </Button>
          <Button variant="primary" onClick={handleSubmit}>
            {customerIdToEdit ? "Cập nhật" : "Thêm"}
          </Button>
        </Modal.Footer>
      </Modal>

      <Modal show={showDeleteModal} onHide={handleCloseDeleteModal}>
        <Modal.Body>
          <h4>Bạn có chắc chắn muốn xoá khách hàng</h4>
          <Form.Check
            type="checkbox"
            label="Tôi chắc chắn muốn xoá"
            checked={canDelete}
            onChange={(e) => setCanDelete(e.target.checked)}
          />
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleCloseDeleteModal}>
            Hủy
          </Button>
          <Button
            variant="danger"
            onClick={handleDelete}
            disabled={!canDelete}
          >
            Xoá
          </Button>
        </Modal.Footer>
      </Modal>

      <Table striped bordered>
        <thead>
          <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Hành động</th>
          </tr>
        </thead>
        <tbody>
          {customers.map((customer) => (
            <tr key={customer.id}>
              <td>{customer.id}</td>
              <td>{customer.name}</td>
              <td>{customer.email}</td>
              <td>{customer.phone_number}</td>
              <td style={{ display: "flex", gap: "10px" }}>
                <Button
                  as="a"
                  variant="primary"
                  onClick={() => handleShowAddEditModal(customer)}
                >
                  Sửa
                </Button>
                <Button
                  as="a"
                  variant="danger"
                  onClick={() => handleShowDeleteModal(customer.id)}
                >
                  Xoá
                </Button>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
    </div>
  );
};

export default CustomerTable;
