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

![Ảnh chụp màn hình 1](link-toi-anh.png)
![Ảnh chụp màn hình 2](link-toi-anh.png)

## 🧑‍💻 Tác giả

* **Họ và tên:** [Điền họ tên của bạn]
* **MSSV:** [Điền mã số sinh viên]
* **GitHub:** [https://github.com/manhhoangg2k2](https://github.com/manhhoangg2k2)

---
