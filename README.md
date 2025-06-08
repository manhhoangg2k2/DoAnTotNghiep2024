# Đồ án tốt nghiệp 2024: Fare Riding App

Đây là repository chính thức cho dự án tốt nghiệp năm 2024 của Đinh Mạnh Hoàng - B20DCCN271.

## 📝 Tổng quan

Đây là dự án Hệ thống đặt xe trực tuyến, gồm 3 phần chính là Ứng dụng dành cho khách hàng, Ứng dụng dành cho tài xế và Web quản lý dành cho Quản trị viên. Dự án này được sinh ra với mục đích tìm hiểu công nghệ và học hỏi thêm những chức năng mới như trên Google Api, MQTT, .... Ngoài ra, đây còn là dự án dành được 9 điểm trong lần bảo vệ đồ án tháng 1/2025 của Học viện công nghệ Bưu chính Viễn thông khoa CNTT1. 

## ✨ Tính năng chính

* **Đối với người dùng:**
    * Đăng nhập, đăng ký tài khoản
    * Tìm kiếm địa điểm, chọn địa điểm đến và đón, Xem trước tổng quan về chuyến đi
    * Đặt xe, theo dõi thực tế quá trình di chuyển, hoàn thành chuyến xe, đánh giá chuyến xe
    * Nạp tiền vào tài khoản
    * Xem thống kê lịch sử chuyến xe
    * Quản lý thông tin cá nhân
      
* **Đối với tài xế:**
    * Đăng nhập, đăng ký tài khoản
    * Xem những chuyến xe ở gần, nhận chuyến xe
    * Thực hiện chuyến xe
    * Nạp tiền vào tài khoản
    * Quản lý thông tin cá nhân
    * Xem thống kê lịch sử chuyến xe
      
* **Đối với quản trị viên (Admin):**
    * Đăng nhập
    * Xem thống kê về hệ thống
    * Quản lý tài xế, quản lý người dùng, quản lý chuyến xe, quản lý nạp tiền
    * Theo dõi vị trí tài xế, theo dõi trạng thái tài xế

## 🚀 Công nghệ sử dụng

Dự án được xây dựng với các công nghệ chính sau:

* **Frontend:** ReactJS
* **Mobile:** Flutter
* **Backend:** NodeJS
* **Cơ sở dữ liệu:** PostgreSQL
* **Khác:** JWT để xác thực, MQTT cho truyền tin real-time, Google API cho dịch vụ về map, OpenWeatherAPI cho api về thời tiết, Python cho server chạy model nhận diện đánh giá tích cực/tiêu cực

## 🔧 Cài đặt và Chạy dự án

Để chạy dự án trên máy của bạn, hãy làm theo các bước sau:

### Yêu cầu hệ thống

* Node.js phiên bản 20.x trở lên
* npm hoặc yarn
* [Ví dụ: Cài đặt và khởi chạy MongoDB Server]

### Hướng dẫn cài đặt

1.  **Clone repository:**
    ```bash
    git clone [https://github.com/manhhoangg2k2/DoAnTotNghiep2024.git](https://github.com/manhhoangg2k2/DoAnTotNghiep2024.git)
    ```

2.  **Di chuyển vào thư mục dự án:**
    ```bash
    cd DoAnTotNghiep2024
    ```

3.  **Cài đặt các gói phụ thuộc cho Backend:**
    *(Giả sử thư mục backend của bạn là `server` hoặc `backend`)*
    ```bash
    cd backend
    npm install
    ```

4.  **Cài đặt các gói phụ thuộc cho Frontend:**
    *(Giả sử thư mục frontend của bạn là `client` hoặc `frontend`)*
    ```bash
    cd ../client
    npm install
    ```
5.  **Cài đặt các gói phụ thuộc cho Mobile:**
    ```bash
    cd ../fare_riding_app
    flutter clean
    flutter pub get
    ```
    
6.  **Cấu hình biến môi trường:**
    * Tạo file `.env` trong thư mục `server`.
        ```env
        # Ví dụ
        PG_USER=postgres
        PG_HOST=localhost
        PG_DATABASE=postgres
        PG_PASSWORD=123456
        PG_PORT=5432
        JWT_SECRET="Dinhmanhhoangg2k2."
        ```

### Chạy dự án

1.  **Khởi chạy Backend Server:**
    *(Trong thư mục `server`)*
    ```bash
    npm start
    # hoặc
    npm run dev
    ```
    Server sẽ chạy tại `http://localhost:PORT` (ví dụ: `http://localhost:8080`).
    
2.  **Khởi chạy Mobile:**
    *(Trong thư mục `fare_riding_app`)*
    Mở máy ảo và chạy 
    ```bash
    flutter run
    ```
    Ứng dụng sẽ được chạy trên máy ảo. Tương tự với fare_riding_app_driver

4.  **Khởi chạy Frontend Application:**
    *(Trong thư mục `client`)*
    ```bash
    npm start
    # hoặc
    npm run dev
    ```
    Ứng dụng sẽ tự động mở trong trình duyệt tại `http://localhost:3000` (hoặc một cổng khác).

##  Demo

[Bạn có thể thêm một vài ảnh chụp màn hình các tính năng nổi bật của ứng dụng tại đây. Hoặc nếu có video demo, hãy chèn link vào đây.]

![image](https://github.com/user-attachments/assets/0b8d9052-284a-42e5-9132-195fca0acaf3)
![image](https://github.com/user-attachments/assets/24352e52-3ff8-4d37-9726-639ea8082f96)
![image](https://github.com/user-attachments/assets/95bc6a1e-901a-4294-b050-c1162ddfaca9)
![image](https://github.com/user-attachments/assets/433d40b1-0036-4fa1-8602-b24b068f315e)
![image](https://github.com/user-attachments/assets/5d391e2d-0255-418f-a523-137885a699e9)
![image](https://github.com/user-attachments/assets/91d67f42-8b2d-4fbc-bab8-8daa3b71e1ae)
![image](https://github.com/user-attachments/assets/4acccae1-ce1a-49dc-999e-c8b71a1090d7)
![image](https://github.com/user-attachments/assets/1d704688-db9a-4c77-98ff-8f0ad3d3130d)
![image](https://github.com/user-attachments/assets/7eb4611f-dd49-417c-af50-fa5072a939b4)
![image](https://github.com/user-attachments/assets/bab496cb-1b2c-475c-bab4-db701faffba0)
![image](https://github.com/user-attachments/assets/61838311-cea6-4ba8-87fd-9381734217b1)
![image](https://github.com/user-attachments/assets/dac43f52-3e9f-42e3-9371-d0ad1b5be909)
![image](https://github.com/user-attachments/assets/c14a9cbe-0eaf-42bd-8e94-e4a7f550170f)
![image](https://github.com/user-attachments/assets/c77612cf-0cd7-4889-9783-f628045ec53e)
![image](https://github.com/user-attachments/assets/e451bd33-3163-4f05-bc2a-5ffee1a2e0ee)

## 🧑‍💻 Tác giả

* **Họ và tên:** [Điền họ tên của bạn]
* **MSSV:** [Điền mã số sinh viên]
* **GitHub:** [https://github.com/manhhoangg2k2](https://github.com/manhhoangg2k2)

---
