import React, { useState, useEffect } from "react";
import api from "../utils/api";
import Table from "react-bootstrap/Table";
import Button from "react-bootstrap/Button";
import Badge from "react-bootstrap/Badge";
import Form from "react-bootstrap/Form";
import Modal from "react-bootstrap/Modal";
import Alert from "react-bootstrap/Alert";

const DriverTable = () => {
  const [drivers, setdrivers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showAddEditModal, setShowAddEditModal] = useState(false);
  const [showDeleteModal, setShowDeleteModal] = useState(false);

  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [phoneNumber, setPhoneNumber] = useState("");
  const [licenceNumber, setLicenceNumber] = useState("");
  const [selectedGender, setSelectedGender] = useState("");
  const [selectedVehicleType, setSelectedVehicleType] = useState("");
  const [vehicleName, setVehicleName] = useState("");
  const [vehicleDes, setVehicleDes] = useState("");
  const [vehicleCode, setVehicleCode] = useState("");
  const [driverIdToEdit, setDriverIdToEdit] = useState(null);
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
  
    if (!vehicleCode.trim()) {
      newErrors.vehicleCode = "Mã phương tiện không được để trống.";
    } else if (!/^[A-Z0-9]{2,3}[A-Z]\d{1} - \d{5}$/.test(vehicleCode)) {
      newErrors.vehicleCode = "Mã phương tiện không hợp lệ. Định dạng phải là 11A1 - 11111.";
    }
    return newErrors;
  };
  

  // Fetch drivers
  const fetchdrivers = async () => {
    setLoading(true);
    try {
      const response = await api.get("/getListDrivers");
      setdrivers(response.data.data.drivers);
    } catch (error) {
      console.error("Error fetching drivers:", error);
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
      if (driverIdToEdit) {
        const id = driverIdToEdit
        await api.put(`/updateDriverInfo`, {
          id,
          name,
          email,
          phoneNumber,
          gender: selectedGender,
          licenceNumber: licenceNumber,
          selectedVehicleType: selectedVehicleType,
          vehicleName: vehicleName,
          vehicleDes: vehicleDes,
          vehicleCode: vehicleCode
        });
      } else {
        await api.post("/addNewDriver", {
          name,
          email,
          phoneNumber,
          gender: selectedGender,
          created_time: new Date().toISOString(),
          licenceNumber: licenceNumber,
          selectedVehicleType: selectedVehicleType,
          vehicleName: vehicleName,
          vehicleDes: vehicleDes,
          vehicleCode: vehicleCode
        });
      }
      setShowAddEditModal(false);
      fetchdrivers();
    } catch (error) {
      console.error("Error saving customer:", error);
    }
  };

  // Delete driver
  const handleDelete = async () => {
    if (!canDelete) return; // Chỉ xóa nếu đã tích checkbox
    try {
      await api.delete(`/deleteDriver/${driverIdToEdit}`);
      setShowDeleteModal(false);
      fetchdrivers();
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
    setDriverIdToEdit(null);
    setErrors({});
  };

  const handleCloseDeleteModal = () => {
    setShowDeleteModal(false);
    setDriverIdToEdit(null);
    setCanDelete(false);
    setCanDelete(false);
  };

  const handleShowAddEditModal = (customer) => {
    if (customer) {
      setName(customer.name);
      setEmail(customer.email);
      setPhoneNumber(customer.phone_number);
      setSelectedGender(customer.gender);
      setDriverIdToEdit(customer.id);
    }
    setShowAddEditModal(true);
  };

  const handleShowDeleteModal = (customerId) => {
    setDriverIdToEdit(customerId);
    setShowDeleteModal(true);
  };

  useEffect(() => {
    fetchdrivers();
  }, []);

  return (
    <div>
      <h1>
        <Badge bg="secondary">Quản lý tài xế</Badge>
      </h1>
      <div style={{ marginBottom: "20px", textAlign: "right" }}>
        <Button variant="success" onClick={() => handleShowAddEditModal()}>
          Thêm tài xế
        </Button>
      </div>
      <Modal show={showAddEditModal} onHide={handleCloseAddEditModal}>
        <Modal.Header closeButton>
          <Modal.Title>{driverIdToEdit ? "Chỉnh sửa tài xế" : "Thêm tài xế"}</Modal.Title>
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
            <Form.Group className="mb-3" controlId="formLicenceNumber">
              <Form.Label>Mã số bằng lái xe</Form.Label>
              <Form.Control
                value={licenceNumber}
                onChange={(e) => setLicenceNumber(e.target.value)}
                placeholder="0123456789"
                // isInvalid={!!errors.phoneNumber}
              />
              {/* <Form.Control.Feedback type="invalid">
                {errors.phoneNumber}
              </Form.Control.Feedback> */}
            </Form.Group>
            <Form.Group controlId="genderDropdown">
              <Form.Label>Chọn loại xe</Form.Label>
              <Form.Select
                value={selectedVehicleType}
                onChange={(e) => setSelectedVehicleType(e.target.value)}
                // isInvalid={!!errors.gender}
              >
                <option value="">Chọn...</option>
                <option value="motorbike">Xe máy</option>
                <option value="car-4">Xe 4 chỗ</option>
                <option value="car-7">Xe 7 chỗ</option>
              </Form.Select>
              {/* <Form.Control.Feedback type="invalid">
                {errors.gender}
              </Form.Control.Feedback> */}
            </Form.Group>
            <Form.Group className="mb-3" controlId="formLicenceNumber">
              <Form.Label>Tên xe</Form.Label>
              <Form.Control
                value={vehicleName}
                onChange={(e) => setVehicleName(e.target.value)}
                placeholder="0123456789"
                // isInvalid={!!errors.phoneNumber}
              />
              {/* <Form.Control.Feedback type="invalid">
                {errors.phoneNumber}
              </Form.Control.Feedback> */}
            </Form.Group>
            <Form.Group className="mb-3" controlId="formLicenceNumber">
              <Form.Label>Mô tả xe</Form.Label>
              <Form.Control
                value={vehicleDes}
                onChange={(e) => setVehicleDes(e.target.value)}
                placeholder="0123456789"
                // isInvalid={!!errors.phoneNumber}
              />
              {/* <Form.Control.Feedback type="invalid">
                {errors.phoneNumber}
              </Form.Control.Feedback> */}
            </Form.Group>
            <Form.Group className="mb-3" controlId="formLicenceNumber">
              <Form.Label>Biến số xe</Form.Label>
              <Form.Control
                value={vehicleCode}
                onChange={(e) => setVehicleCode(e.target.value)}
                placeholder="11T1 - 11111"
                isInvalid={!!errors.vehicleCode}
              />
              <Form.Control.Feedback type="invalid">
                {errors.vehicleCode}
              </Form.Control.Feedback>
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleCloseAddEditModal}>
            Quay lại
          </Button>
          <Button variant="primary" onClick={handleSubmit}>
            {driverIdToEdit ? "Cập nhật" : "Thêm"}
          </Button>
        </Modal.Footer>
      </Modal>

      <Modal show={showDeleteModal} onHide={handleCloseDeleteModal}>
        <Modal.Body>
          <h4>Bạn có chắc chắn muốn xoá tài xế</h4>
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
          {drivers.map((customer) => (
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

export default DriverTable;
