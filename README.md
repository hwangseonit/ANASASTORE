# ANASA STORE - Hệ thống quản lý bán hàng bằng PHP & MySQL

**ANASA STORE** là một dự án PHP kết hợp MySQL, xây dựng hệ thống quản trị cửa hàng đơn giản nhưng đầy đủ chức năng, bao gồm quản lý sản phẩm, khách hàng, kho hàng, đơn hàng, danh mục, bài viết, và bình luận.

## 📦 Tính năng nổi bật

- 🛒 Quản lý sản phẩm, kho hàng, đơn hàng
- 🧑‍💼 Quản lý khách hàng
- 🗂️ Quản lý danh mục sản phẩm và bài viết
- 💬 Quản lý bình luận
- 📦 Xuất đơn hàng sang Excel
- 🔒 Phân quyền đăng nhập trang quản trị
- 📊 Dashboard cơ bản cho admin

## 🧰 Công nghệ sử dụng

- **PHP** thuần (không sử dụng framework)
- **MySQL/MariaDB** (có thư viện PDO)
- **HTML5, CSS3, JavaScript**
- **Bootstrap** template cho giao diện quản trị

## 📁 Cấu trúc thư mục

```
ANASASTORE/
├── admin/                 # Phần quản trị
│   ├── bai-viet/          # Quản lý bài viết
│   ├── binh-luan/         # Quản lý bình luận
│   ├── danh-muc/          # Quản lý danh mục sản phẩm
│   ├── don-hang/          # Quản lý đơn hàng
│   ├── khach-hang/        # Quản lý khách hàng
│   ├── kho-hang/          # Quản lý kho hàng
│   ├── models_admin/      # Các model kết nối DB qua PDO
│   ├── export_exel/       # Chức năng xuất Excel
│   └── components/        # Các phần header, footer, 404,...
├── index.php              # Trang chủ người dùng (nếu có)
├── .htaccess              # Cấu hình Apache
└── README.md              # File hướng dẫn
```

## 🚀 Hướng dẫn cài đặt

### 1. Clone dự án

```bash
git clone https://github.com/HwangSeon/ANASASTORE.git
```

### 2. Cấu hình CSDL

- Tạo database tên là `anasastore`
- Import file SQL (nếu có) vào MySQL bằng phpMyAdmin hoặc dòng lệnh

### 3. Chỉnh thông tin kết nối CSDL

Mở file `models_admin/pdo_library.php` và sửa thông tin:

```php
$host = 'localhost';
$dbname = 'anasastore';
$username = 'root';
$password = '';
```

### 4. Chạy dự án

- Đặt toàn bộ thư mục vào `htdocs` nếu dùng XAMPP
- Truy cập trình duyệt:
  ```
  http://localhost/ANASASTORE/admin/
  ```

## 📷 Ảnh minh họa

_(Bạn có thể clone về chạy và thưởng thức dự án của chúng tôi nhé !)_

## 👨‍💻 Tác giả

- **Tên:** HwangSeon
- **Zalo Hỗ Trợ:** 0979783601
- **Email:** hoangsonvq1@gmail.com
- **GitHub:** [https://github.com/HwangSeon](https://github.com/HwangSeon)

## 📝 Giấy phép

Dự án phát hành theo [MIT License](LICENSE) – bạn có thể sử dụng lại cho mục đích học tập, cá nhân hoặc mở rộng.
