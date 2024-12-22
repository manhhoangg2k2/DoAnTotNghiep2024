import React, { useState, useEffect } from "react";
import { GoogleMap, MarkerF, InfoWindow, useLoadScript } from "@react-google-maps/api";
import Badge from "react-bootstrap/Badge";
import api from "../utils/api";

const mapContainerStyle = {
    width: "100%",
    height: "500px",
};

const center = {
    lat: 21.028511, // Vĩ độ của Hà Nội
    lng: 105.804817, // Kinh độ của Hà Nội
};

// Hàm chuyển đổi giá trị sang số (double)
const toDouble = (value) => {
    const number = parseFloat(value);
    return isNaN(number) ? 0 : number; // Nếu không hợp lệ, trả về 0
};

const MapComponent = () => {
    const { isLoaded } = useLoadScript({
        googleMapsApiKey: "AIzaSyCHZT7bBD4aEcYL9RUM8wR8SbFdGx7BkAA", // Thay bằng API key của bạn
    });

    const [drivers, setDrivers] = useState([]);
    const [loading, setLoading] = useState(false);
    const [selectedDriver, setSelectedDriver] = useState(null);

    const fetchDrivers = async () => {
        setLoading(true);
        try {
            const response = await api.get("/getListDrivers");
            setDrivers(response.data.data.drivers); // Đảm bảo API trả về một danh sách `drivers`
        } catch (error) {
            console.error("Error fetching drivers:", error);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchDrivers();
    }, []);

    if (!isLoaded) return <div>Loading...</div>;
    if (loading) return <div>Loading drivers...</div>;
    console.log("drivers:", drivers)
    return (
        <div>
            <h1>
                <Badge bg="secondary">Quản lý vị trí tài xế</Badge>
            </h1>
            <GoogleMap
                mapContainerStyle={mapContainerStyle}
                zoom={12}
                center={center}
            >
                {drivers.map((driver, i) => (
                    <MarkerF
                        key={i}
                        position={{
                            lat: toDouble(driver.lastest_location_lat),
                            lng: toDouble(driver.lastest_location_lng),
                        }}
                        onClick={() => setSelectedDriver(driver)}
                    />
                ))}

                {selectedDriver && (
                    <InfoWindow
                        position={{
                            lat: toDouble(selectedDriver.lastest_location_lat),
                            lng: toDouble(selectedDriver.lastest_location_lng),
                        }}
                        onCloseClick={() => setSelectedDriver(null)}
                    >
                        <div>
                            <h4>Thông tin tài xế</h4>
                            <p>Tên: {selectedDriver.name}</p>
                            <p>Số điện thoại: {selectedDriver.phone_number}</p>
                            <p>Vĩ độ: {toDouble(selectedDriver.lastest_location_lat)}</p>
                            <p>Kinh độ: {toDouble(selectedDriver.lastest_location_lng)}</p>
                        </div>
                    </InfoWindow>
                )}
            </GoogleMap>
        </div>

    );
};

export default MapComponent;
