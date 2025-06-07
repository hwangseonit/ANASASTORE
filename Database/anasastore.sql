-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2025 at 06:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anasastore`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `image`, `status`) VALUES
(2, 'Điện Thoại', 'Dienthoai.jpg', 1),
(4, 'Laptop', 'Laptop.jpg', 1),
(6, 'Phụ Kiện', 'Phukien.jpg', 1),
(16, 'Linh Kiện', 'Linhkien.jpg', 1),
(17, 'Đồng Hồ', 'Dongho.jpg', 1),
(19, 'Điện Lạnh', 'DienLanh.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 ẩn 1 hiện',
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `content`, `date`, `status`, `user_id`, `product_id`) VALUES
(16, 'Tủ lạnh này có tiêu tốn nhiều điện năng không ?', '2025-06-06 00:13:20', 1, 22, 52),
(17, 'Sản phẩm này tốt nè !', '2025-06-06 00:13:39', 1, 22, 46),
(18, 'Sản phẩm này giá cao quá !', '2025-06-06 00:15:29', 1, 23, 25),
(19, 'Nhìn nó đẹp quá !', '2025-06-06 00:15:39', 1, 23, 50);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetails_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderdetails_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(153, 86, 51, 3, 8500000),
(154, 86, 26, 2, 30590000),
(157, 88, 51, 2, 8500000),
(158, 88, 46, 2, 12000),
(159, 89, 51, 2, 8500000),
(160, 89, 46, 2, 12000),
(161, 90, 48, 3, 16000000),
(162, 90, 52, 3, 22290000),
(163, 91, 48, 3, 16000000),
(164, 91, 52, 3, 22290000),
(165, 92, 51, 1, 8500000),
(166, 93, 45, 2, 186000),
(190, 109, 51, 3, 8500000),
(191, 110, 51, 3, 8500000),
(192, 111, 14, 3, 20450000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `total` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `date`, `total`, `address`, `phone`, `note`, `status`) VALUES
(86, 22, '2025-06-05 00:12:16', 86680000, 'Tòa A3 Vinhomes Gardenia', '0979783601', 'Cẩn thẩn không bị vỡ mặt hàng', 4),
(88, 22, '2025-06-03 02:09:28', 17024000, 'Tòa A3 Vinhomes Gardenia', '0979783601', 'Thanh toán Momo !', 4),
(89, 22, '2025-06-02 02:09:33', 17024000, 'Tòa A3 Vinhomes Gardenia', '0979783601', 'Thanh toán Momo !', 4),
(90, 22, '2025-06-01 02:11:00', 114870000, 'Tòa A3 Vinhomes Gardenia', '0979783601', 'Giao nhanh giúp tôi !', 4),
(91, 22, '2025-05-31 02:13:03', 114870000, 'Tòa A3 Vinhomes Gardenia', '0979783601', 'Giao nhanh giúp tôi !', 4),
(92, 22, '2025-05-29 02:15:10', 8500000, 'Tòa A3 Vinhomes Gardenia', '0979783601', 'Hàng tốt đó !', 4),
(93, 22, '2025-06-06 02:30:09', 372000, 'Trường Khánh, Long Thạnh, Phụng Hiệp, Hậu Giang', '0909135999', 'Đơn hàng này thật tuyệt !', 4),
(109, 22, '2025-06-07 23:20:56', 25500000, 'Tòa A3 Vinhomes Gardenia', '0979783601', 'Thanh toán Momo', 4),
(110, 8, '2025-06-07 23:22:46', 25500000, 'Cần Thơ', '0336216559', 'Thanh toán Momo', 4),
(111, 22, '2025-06-07 23:55:38', 61350000, 'Tòa A3 Vinhomes Gardenia', '0979783601', 'Thanh toán khi nhận hàng !', 2);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `category_id`, `title`, `image`, `author`, `content`, `views`, `status`, `created_at`, `updated_at`) VALUES
(5, 1, 'Dấu chấm hết cho điện thoại Sony sản xuất', 'Sony.jpg', 'Admin', '<p><strong>Chưa rõ đối tác nào tiếp quản khâu sản xuất smartphone Xperia cao cấp cho tập đoàn điện tử Nhật Bản.</strong><br><img src=\"https://photo.znews.vn/w960/Uploaded/pqmcbzwv/2025_06_01/Sony_Xperia_1_VII_review_rear_cameras.jpeg\" width=\"960\" height=\"640\"><br>Trang web <i>Sumaho Digest</i> đưa tin, <a href=\"https://znews.vn/tieu-diem/sony.html\">Sony</a> xóa chữ “điện thoại thông minh” khỏi các trang web giới thiệu về quy trình sản xuất của mình tại Trung Quốc và Thái Lan vào giữa tháng 5, trước thời điểm ra mắt model Xperia mới.</p><p>Điều đó đồng nghĩa với việc Sony sẽ chuyển hoạt động sản xuất Xperia 1 VII cho một đối tác bên thứ 3, tương tự cách làm với các điện thoại tầm trung của họ trong những năm gần đây.</p><p>Dự kiến Xperia 1 VII có mặt trên thị trường vào cuối tháng 6. Do đó, hiện tại khó dự đoán mức độ hoàn thiện của sản phẩm có đồng nhất với những thiết bị do chính Sony sản xuất trước đây hay không.</p><p>Hai trang công nghệ <i>GSMArena</i> và <i>Stuff</i> đều có bài đánh giá sớm về điện thoại này. Tuy nhiên, không bên nào nhắc đến thay đổi lớn liên quan đến mức độ hoàn thiện. Việc chuyển hoạt động sản xuất sang bên thứ 3 có thể giúp Sony cắt giảm chi phí vì các nhà đối tác có thể hoạt động với quy mô lớn hơn.</p><p>Sony Xperia là một trong những dòng điện thoại Android đắt nhất hiện nay, nhưng động thái chuyển giao sản xuất dường như không làm thay đổi giá của Xperia 1 VII. Thậm chí máy được bán ở mức cao hơn phiên bản trước.</p><p>Sony công bố Xperia 1 VII vào giữa tháng 5. Thiết bị được định vị ở phân khúc cao cấp với cấu hình cơ bản gồm chipset Qualcomm Snapdragon 8 Elite, màn hình OLED LTPO 6,5 inch, RAM 12 GB, bộ 3 camera gồm góc rộng 48 MP, góc siêu rộng 48 MP và camera tele 12 MP, pin 5.000 mAh, sạc nhanh 30 W, hỗ trợ sạc không dây 15 W.</p><p>Xperia 1 VII có các phiên bản màu xanh, tím, đen; cho phép đặt trước với giá từ 1.499 EUR (tương đương 1.700 USD) cho phiên bản bộ nhớ trong 265 GB tại thị trường châu Âu. Giá bán này cao hơn phiên bản Xperia 1 VI ra mắt cách đây một năm.</p>', 0, 1, '2023-11-29 17:25:47', '2025-06-01 22:13:58'),
(8, 2, 'Điện thoại AI là gì? Có trên điện thoại nào? Có tính năng gì nổi bật', 'Ai.jpg', 'Admin', '<h3>1. Điện thoại AI là gì?</h3><p>Điện thoại AI (AI Phone), hiểu đơn giản là các mẫu điện thoại thông minh có tích hợp công nghệ trí tuệ nhân tạo (AI). AI sẽ giúp cải thiện hiệu suất, tối ưu trải nghiệm người dùng và hỗ trợ các tính năng như chụp ảnh, bảo mật và trợ lý ảo.</p><h4>Đặc điểm nhận biết điện thoại AI</h4><ul><li>Điện thoại có chip tích hợp AI như Snapdragon Elite, Tensor, A-series Bionic (Apple).</li><li>Hỗ trợ trợ lý ảo như Google Assistant, Siri, Bixby, Galaxy AI</li><li>Camera AI với khả năng nhận diện cảnh và chỉnh sửa ảnh tự động.</li><li>Các tính năng bảo mật nâng cao như nhận diện khuôn mặt, vân tay AI.</li><li>Tích hợp AI trong quản lý pin, hiệu suất và đề xuất nội dung thông minh.<br><img src=\"https://cdn.tgdd.vn/Products/Images/42/329135/iphone-16-acv-5.jpg\" alt=\"iPhone 16 - Thiết kế (Nguồn: Apple.com)\" width=\"1020\" height=\"570\"><br>Tại sao công nghệ AI lại quan trọng với điện thoại smartphone?</li></ul><p>Công nghệ AI giúp điện thoại trở nên thông minh hơn bằng cách học hỏi hành vi người dùng, tối ưu hóa hiệu suất và cung cấp các tính năng tự động hóa, giúp tiết kiệm thời gian và tăng cường trải nghiệm tổng thể.</p><p>So với điện thoại không hỗ trợ AI, các thiết bị AI có khả năng tự động điều chỉnh và tối ưu hóa hoạt động, giúp người dùng thao tác nhanh hơn và hiệu quả hơn.</p><h4>Điện thoại AI có trên điện thoại nào?</h4><p>Ngày càng nhiều hãng điện thoại lớn sản xuất các dòng điện thoại AI, với các tính năng AI hỗ trợ tiện lợi cho người dùng. Dưới đây là danh sách một số hãng và mẫu điện thoại AI bạn có thể tham khảo:</p><ul><li>Apple: Các mẫu điện thoại <a href=\"https://www.thegioididong.com/dtdd-apple-iphone-16-series\">iPhone 16 Series</a>, iPhone 15 Pro, <a href=\"https://www.thegioididong.com/dtdd/iphone-15-pro-max\">iPhone 15 Pro Max</a></li><li>Google: Các mẫu điện thoại Google Pixel 9 Pro, Pixel 8 Pro, Pixel 7</li><li>Samsung: Các mẫu điện thoại <a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-s25\">Galaxy S25</a>, <a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-z-fold6\">Galaxy Z Fold6</a>, <a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-z-flip6\">Galaxy ZFlip 6</a>, <a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-s24-ultra-5g\">Galaxy S24 Ultra</a></li><li>Xiaomi: <a href=\"https://www.thegioididong.com/dtdd/xiaomi-redmi-note-14\">Redmi Note 14</a>, <a href=\"https://www.thegioididong.com/dtdd/xiaomi-redmi-note-14-pro\">Redmi Note 14 Pro</a>, <a href=\"https://www.thegioididong.com/dtdd/xiaomi-14t-5g\">Xiaomi 14T</a></li><li>OnePlus: OnePlus 12 Pro, OnePlus 11</li><li>Oppo: <a href=\"https://www.thegioididong.com/dtdd/oppo-find-x8\">Oppo Find X8</a>, <a href=\"https://www.thegioididong.com/dtdd/oppo-find-n3\">Oppo Find N3</a><br>2. Các tính năng nổi bật của điện thoại AI</li></ul><h4>Trợ lý ảo thông minh</h4><p>Trợ lý ảo AI là một phần mềm tích hợp trên điện thoại thông minh, giúp người dùng thực hiện các tác vụ nhanh chóng thông qua giọng nói hoặc cử chỉ. AI giúp các trợ lý này hiểu ngữ cảnh, học hỏi thói quen người dùng và phản hồi thông minh hơn theo thời gian. Các trợ lý ảo AI nổi tiếng mà có thể bạn đã nghe tới như:</p><ul><li><a href=\"https://www.thegioididong.com/hoi-dap/siri-la-gi-cach-su-dung-siri-590970\"><strong>Siri</strong></a><strong> (Apple)</strong>: Là trợ lý ảo của Apple, có mặt trên các dòng iPhone và iPad.</li><li><strong>Google Assistant (Android)</strong>: Xuất hiện trên hầu hết các điện thoại Android, điển hình như: Google Pixel, Samsung, Xiaomi.</li><li><a href=\"https://www.thegioididong.com/hoi-dap/kham-pha-tro-ly-ao-samsung-bixby-1172341\"><strong>Bixby</strong></a><strong> (Samsung)</strong>: Tích hợp trên các dòng điện thoại Samsung Galaxy. Bixyby có khả năng tự động hóa tác vụ trên điện thoại, giúp tối ưu hóa các thói quen sử dụng hằng ngày của người dùng.</li><li><a href=\"https://www.thegioididong.com/hoi-dap/Galaxy%20AI%20l%C3%A0%20g%C3%AC?%20C%C3%B3%20tr%C3%AAn%20thi%E1%BA%BFt%20b%E1%BB%8B%20n%C3%A0o?%205%20t%C3%ADnh%20n%C4%83ng%20n%E1%BB%95i%20b%E1%BA%ADt\"><strong>Galaxy AI</strong></a><strong> (Samsung)</strong>: Phiên bản AI tiên tiến nhất của Samsung. Hỗ trợ chỉnh sửa hình ảnh bằng AI, dịch thuật tức thời và tạo nội dung dựa trên sở thích người dùng.</li></ul><h4>Chụp ảnh thông minh</h4><p>Một trong những lợi ích dễ thấy nhất của điện thoại AI cho người dùng là khả năng chụp ảnh đẹp và sắc nét hơn. AI giúp nhận diện cảnh vật và tự động điều chỉnh thông số để tạo ra bức ảnh sắc nét, sống động hơn.</p><p>Khi dùng điện thoại AI, nếu bạn chụp ảnh hoàng hôn, AI sẽ tự động tăng cường độ ấm và điều chỉnh độ phơi sáng.</p><p>Hoặc bạn có thể xóa vật thể không mong muốn, điều chỉnh ánh sáng và màu sắc tự động. Nếu bạn chụp ảnh và có người đi ngang qua, AI có thể tự động xóa bỏ họ mà không làm ảnh hưởng đến bối cảnh.<br><img src=\"https://cdnv2.tgdd.vn/mwg-static/common/News/1574722/tong-hop-cac-tinh-nang-ai-moi-tren-samsung-galaxy-s25-8.jpg\" alt=\"Camera AI trên Samsung Galaxy S25\" width=\"1600\" height=\"900\"><br>Bảo mật hơn nhờ AI</p><p>Một trong những lợi ích lớn nhất của AI trên điện thoại là khả năng mở khóa nhanh chóng và an toàn.</p><p>Nếu bạn đang vội hoặc tay đang bận, AI giúp nhận diện khuôn mặt ngay lập tức, mở khóa thiết bị mà không cần nhập mật khẩu. Không chỉ vậy, hệ thống AI còn cải thiện độ chính xác khi nhận diện, giúp tránh trường hợp nhận diện nhầm hoặc khó mở khóa trong điều kiện ánh sáng yếu.</p><h4>Cá nhân hóa trải nghiệm tốt hơn</h4><p>AI học hỏi thói quen sử dụng ứng dụng và đưa ra các đề xuất phù hợp. Nếu bạn thường xem YouTube vào giờ ăn trưa, điện thoại AI có thể tự động gợi ý video yêu thích.</p><p>Đưa ra đề xuất nội dung, tối ưu hóa giao diện và hiệu suất ứng dụng giúp thao tác nhanh chóng và dễ dàng hơn.</p><h3>3. Có nên mua điện thoại AI không?</h3><p>Điện thoại AI mang lại nhiều lợi ích cho người dùng, nhưng có đáng để đầu tư không? Điều này phụ thuộc vào nhu cầu cá nhân của bạn.</p><p><strong>Bạn nên mua điện thoại AI nếu:</strong></p><ul><li>Bạn muốn một chiếc điện thoại có hiệu suất mạnh mẽ, tối ưu hóa pin và hệ thống hoạt động thông minh.</li><li>Bạn yêu thích chụp ảnh chuyên nghiệp, với khả năng chỉnh sửa tự động, nhận diện cảnh vật và tối ưu hóa màu sắc.</li><li>Bạn cần một trợ lý ảo mạnh mẽ như Siri, Google Assistant hay Galaxy AI để hỗ trợ công việc và cuộc sống hàng ngày.</li><li>Bạn quan tâm đến bảo mật, với các tính năng nhận diện khuôn mặt và vân tay AI giúp thiết bị an toàn hơn.</li></ul><p><strong>Bạn có thể cân nhắc nếu:</strong></p><ul><li>Bạn chỉ cần một chiếc điện thoại cơ bản, không quan tâm đến các tính năng AI nâng cao.</li><li>Một số tính năng AI có thể tiêu hao pin nhanh hơn, dù đã có công nghệ tối ưu hóa.</li></ul>', 0, 1, '2023-12-03 13:45:32', '2025-06-01 22:16:46'),
(9, 9, 'TOP 12 hãng điện thoại lớn nhất thế giới, nổi tiếng, tốt hiện nay', 'Top.jpg', 'Admin', '<h3><strong>1. TOP 4 hãng điện thoại lớn nhất thế giới cho đến hiện nay</strong></h3><p><strong>Apple</strong><br>Apple là một tập đoàn công nghệ có nguồn gốc từ Mỹ, được thành lập vào ngày 1 tháng 4 năm 1976 với trụ sở chính tại California. Bên cạnh chất lượng sản phẩm tốt, một điểm mạnh mang tính khác biệt mà Apple đã tạo nên cho iPhone chính là hệ điều hành iOS độc quyền do chính Apple phát triển.<br>Với điện thoại, Apple nổi tiếng với sự thành công từ dòng <a href=\"https://www.thegioididong.com/dtdd-apple-iphone\">iPhone</a> được người tiêu dùng trên toàn cầu tin tưởng lựa chọn trong nhiều năm liền. iPhone chủ yếu có 4 loại sản phẩm chính bao gồm iPhone mini, iPhone, iPhone Pro và iPhone Pro Max.<br><img src=\"https://cdn.tgdd.vn/News/1468407/top-10-hang-dien-thoai-lon-nhat-the-gioi-cho-den00171-800x450.jpg\" alt=\"Một cửa hàng bán sản phẩm của Apple\" width=\"800\" height=\"450\"><br><strong>Samsung</strong><br>Samsung là tập đoàn công nghệ đa quốc gia đến từ Hàn Quốc, được sáng lập vào năm 1938, trụ sở chính đặt tại khu phức hợp Samsung Town, thành phố Seoul. Theo số liệu đến năm 2021, Samsung là thương hiệu điện thoại có thị phần cao nhất trên toàn cầu tính theo số lượng máy bán ra.</p><p>Các dòng <a href=\"https://www.thegioididong.com/dtdd-samsung\">điện thoại Samsung</a> có thiết kế theo khuynh hướng hiện đại, thời thượng, kiểu dáng mỏng nhẹ, đa dạng mẫu mã. Tại Việt Nam, Samsung phân phối đến thị trường 4 dòng điện thoại chính bao gồm <a href=\"https://www.thegioididong.com/dtdd-samsung-galaxy-a\">dòng Galaxy A</a> (tầm trung), <a href=\"https://www.thegioididong.com/dtdd-samsung-galaxy-m\">dòng Galaxy M</a> (giá rẻ), <a href=\"https://www.thegioididong.com/dtdd-samsung-galaxy-s\">dòng Galaxy S</a> và <a href=\"https://www.thegioididong.com/dtdd-samsung-galaxy-z\">dòng Galaxy Z</a> (cao cấp).<br><img src=\"https://cdn.tgdd.vn/News/1468407/top-10-hang-dien-thoai-lon-nhat-the-gioi-cho-den00162-800x450.jpg\" alt=\"Một cửa hàng bán sản phẩm của Samsung\" width=\"800\" height=\"450\"><br><strong>Nokia</strong><br>Nokia, thương hiệu điện thoại huyền thoại của Phần Lan, được thành lập vào năm 1865. Từ những chiếc điện thoại phổ thông bền bỉ như Nokia 3310, Nokia 1100, Nokia N-Gage thống trị thị trường những năm 2000, <a href=\"https://www.thegioididong.com/dtdd-nokia\">điện thoại Nokia</a> giờ đây tập trung vào phân khúc giá rẻ và tầm trung với các dòng Nokia G Series, Nokia C Series, Nokia X Series, bao gồm cả điện thoại phổ thông và điện thoại cảm ứng.</p><p>Điện thoại phổ thông Nokia vẫn giữ được nét đặc trưng là độ bền bỉ, pin \"trâu\", phù hợp với người dùng có nhu cầu cơ bản. Điện thoại cảm ứng Nokia được trang bị màn hình cảm ứng, kết nối 3G/4G, camera, và các ứng dụng cơ bản, nhằm đáp ứng nhu cầu kết nối và giải trí của người dùng. Điện thoại Nokia nổi bật với độ bền bỉ, pin \"trâu\", giao diện đơn giản và giá cả phải chăng, phù hợp với người dùng muốn sở hữu thiết bị bền bỉ, đáng tin cậy.<br><img src=\"https://cdn.tgdd.vn/hoi-dap/552399/nokia-la-dien-thoai-cua-nuoc-nao%20(1).jpg\" alt=\"Điện thoại Nokia\" width=\"800\" height=\"450\"><br><strong>Xiaomi</strong><br>Xiaomi là thương hiệu điện tử đến từ Trung Quốc, được thành lập vào tháng 04 năm 2010, có trụ sở tại Bắc Kinh. Dù là thương hiệu có tuổi đời còn non trẻ nhưng Xiaomi đã có tốc độ phát triển rất nhanh để trở thành thương hiệu điện thoại chiếm thị phần thứ ba trên toàn cầu trong năm 2021.</p><p><a href=\"https://www.thegioididong.com/dtdd-xiaomi\">Điện thoại Xiaomi</a> chủ yếu hướng đến tệp khách hàng ưa thích phong cách thiết kế trẻ trung, cấu hình điện thoại mạnh mẽ cùng mức giá thành không quá cao. Tại Việt Nam, Xiaomi có 3 dòng điện thoại chính bao gồm <a href=\"https://www.thegioididong.com/dtdd-xiaomi-redmi\">Xiaomi Redmi</a> và Xiaomi POCO (tầm trung và giá rẻ), <a href=\"https://www.thegioididong.com/dtdd-xiaomi-mi\">Xiaomi Mi</a> (cao cấp).<br><img src=\"https://cdn.tgdd.vn/News/1468407/top-10-hang-dien-thoai-lon-nhat-the-gioi-cho-den00153-800x450.jpg\" alt=\"Một cửa hàng bán sản phẩm của Xiaomi\" width=\"800\" height=\"450\"><br>&nbsp;</p>', 0, 1, '2023-12-03 17:41:06', '2025-06-01 22:22:50'),
(13, 15, 'Huawei đang phát triển chip 3 nm, ra mắt năm sau', 'Moi.jpg', 'Admin', '<p>Huawei được cho là đang phát triển chip 3 nm, dự kiến trình làng năm sau và xưởng đúc SMIC đảm nhiệm khâu sản xuất.</p><p>Theo <i>United Daily News</i>, <a href=\"https://vnexpress.net/chu-de/huawei-1560\">Huawei</a> không thể sử dụng công nghệ quang khắc siêu cực tím (EUV) do lệnh cấm của Mỹ, nhưng đã tìm ra giải pháp riêng từ các đối tác trong nước.</p><p>Bộ phận R&amp;D của công ty đang áp dụng hai phương pháp cho chip 3 nm mới. Một là kiến trúc cổng vòm GAA (Gate-All-Around) - tiêu chuẩn đang được TSMC và Samsung sử dụng. Đây là loại cấu trúc bóng bán dẫn tiên tiến, giúp cải thiện hiệu suất, giảm công suất tiêu thụ và nâng cao khả năng mở rộng của các thiết bị điện tử. Trong đó, phần cổng transistor bao quanh hoàn toàn kênh, cho phép kiểm soát tốt hơn dòng điện chạy qua, giúp cải thiện hiệu suất và giảm công suất tiêu thụ.<br><img src=\"https://i1-vnexpress.vnecdn.net/2025/05/31/7le7hxy1gd2f1-1748705944-8456-1748706318.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=y2qYeHA0_fdeRb_IisLJ8A\" alt=\"Minh họa về chip Kirin X90 của Huawei. Ảnh: Reddit\" width=\"680\" height=\"453\"><br>Phương pháp còn lại được Huawei áp dụng dựa trên công nghệ \"ống nano carbon\" thay cho chất bán dẫn silicon truyền thống. Ống có cấu trúc hình trụ nhỏ, được tạo thành từ các nguyên tử carbon sắp xếp theo hình lục giác, cho phép electron (hạt tích điện) chạy qua với điện trở tối thiểu, khiến ống nano carbon trở thành chất dẫn điện tốt hơn.</p><p>Nguồn tin cho biết, việc phát triển chip 3 nm của Huawei dựa trên công nghệ này hiện đã hoàn tất quá trình xác minh trong phòng thí nghiệm, đang được điều chỉnh để đưa vào dây chuyền sản xuất của SMIC và có mặt trên thị trường năm tới.</p><p>Huawei chưa đưa ra bình luận.</p><p>Tháng trước, Huawei ra mắt laptop MateBook Fold với màn hình gập lại, có thể sử dụng linh hoạt như một máy tính xách tay hoặc máy tính bảng cỡ lớn. Ngoài tấm nền gập, một trong những điểm thu hút sự chú ý trên sản phẩm là chip Kirin X90 sản xuất trên tiến trình 5 nm, gồm 10 lõi CPU, bố trí theo cấu trúc 4+4+2, hỗ trợ 20 luồng xử lý nhờ công nghệ đa luồng đồng thời (SMT), đạt chứng nhận mã hóa SM3 và SM4 của Trung Quốc.</p><p>Thực tế, chip được sản xuất trên tiến trình N+2 (7 nm) của SMIC và công nghệ đóng gói 4 nm của Changdian Technology. Có nghĩa khả năng xử lý thực tế của nó chỉ tương đương chip 7 nm nhưng công nghệ đóng gói tốt hơn, giúp tăng hiệu suất so với chip 7 nm thông thường, dù chưa thể tương đương chip 5 nm của các hãng khác.</p><p>Ngoài ra, do chỉ sử dụng máy quang khắc cực tím DUV để khắc đi khắc lại nhiều lần cho đến khi đạt đến 5 nm, sản lượng chip giảm 50%, khiến chi phí sản xuất tăng lên. Mẫu DUV dùng để tạo chip này được cho là SSA800 do Shanghai Micro Electronics (SMEE) sản xuất.</p><p>Theo dự đoán của <i>GizChina</i>, chip 3 nm năm tới có thể vẫn sử dụng cách sản xuất giống Kirin X90 bằng cách tận dụng các cỗ máy DUV, nghĩa là sản lượng có thể hạn chế và giá thành cao.</p>', 0, 1, '2025-05-30 19:13:02', '2025-06-01 22:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`) VALUES
(1, 'Công nghệ mới'),
(2, 'Trí tuệ nhân tạo'),
(9, 'Top sản phẩm lớn'),
(15, 'Phát triển mới');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sell_quantity` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) NOT NULL DEFAULT 0,
  `details` text NOT NULL,
  `short_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `image`, `quantity`, `sell_quantity`, `price`, `sale_price`, `create_date`, `views`, `details`, `short_description`, `status`) VALUES
(1, 2, 'iPhone 11 Pro Max', 'iPhone11ProMax.jpg', 100, 0, 18590000, 15000000, '2023-11-18 08:22:03', 9, '<p><strong>Màn hình</strong>: 6.5 inch Super Retina XDR OLED, HDR10</p><p><strong>Chip</strong>: Apple A13 Bionic (7nm+, hiệu năng ổn định)</p><p><strong>RAM</strong>: 4GB</p><p><strong>Bộ nhớ trong</strong>: 64GB / 256GB / 512GB</p><p><strong>Camera sau</strong>: 12MP chính + 12MP góc rộng + 12MP tele 2X</p><p><strong>Camera trước</strong>: 12MP, hỗ trợ Face ID và quay 4K</p><p><strong>Pin</strong>: 3.969 mAh, sạc nhanh 18W (Lightning)</p><p><strong>Hệ điều hành</strong>: iOS 13 (có thể nâng cấp lên iOS 17)</p>', '<p>Nhà sản xuất: <strong>Apple</strong> &nbsp; Xuất xứ: <strong>Việt Nam</strong></p>', 1),
(2, 2, 'Xiaomi 14T Pro', 'Xiaomi14TPro.webp', 100, 0, 25590000, 24590000, '2023-11-18 10:15:54', 1, '<p><strong>Màn hình</strong>: 6.67 inch AMOLED, độ phân giải 2712 x 1220, tần số quét 144Hz, độ sáng 4000 nits&nbsp;</p><p><strong>Chip</strong>: MediaTek Dimensity 9300+ (4nm), CPU 8 nhân, GPU Immortalis-G720 MC12&nbsp;</p><p><strong>RAM</strong>: 12GB / 16GB</p><p><strong>Bộ nhớ trong</strong>: 256GB / 512GB / 1TB (UFS 4.0)</p><p><strong>Camera sau</strong>: 50MP chính (Light Fusion 900) + 50MP tele 5X + 12MP góc siêu rộng&nbsp;</p><p><strong>Camera trước</strong>: 32MP, hỗ trợ quay video 4K</p><p><strong>Pin</strong>: 5000 mAh, sạc nhanh 120W có dây, sạc không dây 50W&nbsp;</p><p><strong>Hệ điều hành</strong>: Android 14 với giao diện HyperOS</p>', '<p>Nhà sản xuất: <strong>Xiaomi</strong> &nbsp; &nbsp;Xuất xứ: <strong>Trung Quốc</strong></p>', 1),
(6, 2, 'OPPO FIND N5', 'OPPOFINDN5.jpg', 100, 0, 29990000, 25590000, '2023-11-20 22:23:49', 1, '<p><strong>Màn hình</strong>: Gập OLED 8.12\", phụ 6.62\", cả hai 120Hz</p><p><strong>Chip</strong>: Snapdragon 8 Gen 4 (Elite)</p><p><strong>RAM</strong>: 16GB</p><p><strong>Bộ nhớ trong</strong>: 512GB (UFS 4.0)</p><p><strong>Camera sau</strong>: 50MP chính + 50MP tele 3X + 8MP góc rộng (Hasselblad)</p><p><strong>Camera trước</strong>: 8MP (màn hình chính &amp; phụ)</p><p><strong>Pin</strong>: 5600 mAh, sạc nhanh 80W, không dây 50W</p><p><strong>Hệ điều hành</strong>: ColorOS 15 (Android 15)</p>', '<p>Nhà sản xuất: <strong>Oppo</strong> &nbsp; &nbsp; Xuất xứ: <strong>Trung Quốc</strong></p>', 1),
(14, 17, 'Apple Watch Series 10 GPS + Cellular 42mm Viền Titan Dây Milanese', 'AppleWatch.jpg', 93, 7, 21290000, 20450000, '2023-11-20 22:54:49', 2, '<p><strong>Kích thước:</strong> Cao 42mm × Rộng 36mm × Dày 9.7mm</p><p><strong>Màn hình:</strong> OLED Retina LTPO, độ phân giải 374 x 446 pixel, Always-On Display, diện tích hiển thị 989mm²</p><p><strong>Chất liệu:</strong> Vỏ Titan cao cấp, mặt kính sapphire, dây đeo Milanese Loop bằng thép không gỉ</p><p><strong>Trọng lượng:</strong> Khoảng 34.4g</p><p><strong>Chip xử lý:</strong> Apple S10 SiP, CPU lõi kép 64-bit, tích hợp Neural Engine</p><p><strong>Bộ nhớ trong:</strong> 64GB</p><p><strong>Kết nối:</strong> GPS, LTE (eSIM), Wi-Fi, Bluetooth 5.3, NFC, GLONASS, Galileo, BeiDou</p><p><strong>Cảm biến:</strong> Nhịp tim quang học, điện tâm đồ (ECG), SpO2, nhiệt độ, gia tốc kế, con quay hồi chuyển, cảm biến ánh sáng</p><p><strong>Tính năng:</strong> Gọi điện độc lập qua eSIM, đo ECG, đo SpO2, phát hiện té ngã, SOS khẩn cấp, theo dõi giấc ngủ, theo dõi chu kỳ, cảm biến môi trường nước và nhiệt độ</p><p><strong>Pin:</strong> Thời lượng dùng lên đến 18 giờ, sạc nhanh 80% trong 30 phút</p><p><strong>Hệ điều hành:</strong> watchOS 11</p>', '<p>Nhà sản xuất: <strong>Apple</strong> &nbsp; &nbsp; &nbsp;Xuất xứ: <strong>Mỹ</strong></p>', 1),
(15, 17, 'Đồng Hồ Orient Nam RA-AR0005Y30B', 'OrientVip.webp', 100, 0, 10010000, 8008000, '2023-11-20 23:05:47', 2, '<figure class=\"table\"><table><tbody><tr><td><strong>Thương hiệu: </strong><a href=\"https://www.watchstore.vn/dong-ho-orient-chinh-hang-c1\">Orient</a></td><td><strong>Xuất xứ: </strong>Nhật</td></tr><tr><td><strong>Đối tượng: </strong><a href=\"https://www.watchstore.vn/dong-ho-nam-chinh-hang-c1\">Nam</a></td><td><strong>Kháng nước: </strong>5atm</td></tr><tr><td><strong>Loại máy: </strong>Cơ</td><td><strong>Chất liệu kính: </strong>Kính Sapphire</td></tr><tr><td><strong>Chất liệu dây: </strong>Dây Da</td><td><strong>Size mặt: </strong>40.8mm</td></tr><tr><td><strong>Độ dầy: </strong>11mm</td><td><strong>Khoảng trữ cót: </strong>40 tiếng</td></tr></tbody></table></figure>', '<p>Nhà sản xuất: <strong>Orient</strong> &nbsp; &nbsp; &nbsp;Xuất xứ: <strong>Nhật Bản</strong></p>', 1),
(16, 17, 'Đồng Hồ Olym Pianus Nam OP990-45ADGS-GL-D', 'Olym.webp', 100, 0, 8800000, 6336000, '2023-11-20 23:09:13', 3, '<figure class=\"table\"><table><tbody><tr><td><strong>Thương hiệu: </strong><a href=\"https://www.watchstore.vn/dong-ho-olym-pianus-chinh-hang-c1\">Olym Pianus</a></td><td><strong>Đối tượng: </strong><a href=\"https://www.watchstore.vn/dong-ho-nam-chinh-hang-c1\">Nam</a></td></tr><tr><td><strong>Kháng nước: </strong>5atm</td><td><strong>Loại máy: </strong>Cơ</td></tr><tr><td><strong>Chất liệu kính: </strong>Kính Sapphire</td><td><strong>Chất liệu dây: </strong>Dây Cao Su</td></tr><tr><td><strong>Size mặt: </strong>42mm</td><td><strong>Độ dầy: </strong>11mm</td></tr><tr><td><strong>Khoảng trữ cót: </strong>40 tiếng</td><td><strong>Tiện ích: </strong>Lịch thứ, Lịch ngày, Giờ, phút, giây</td></tr></tbody></table></figure><p>&nbsp;</p>', '<p>Nhà sản xuất: <strong>Olym Pianus</strong> &nbsp; &nbsp;Xuất xứ: <strong>Trung Quốc</strong></p>', 1),
(17, 17, 'Đồng Hồ Orient SK RA-AA0B02R39B', 'Orient.webp', 98, 2, 8000000, 6400000, '2023-11-20 23:12:48', 1, '<figure class=\"table\"><table><tbody><tr><td><strong>Thương hiệu: </strong><a href=\"https://www.watchstore.vn/dong-ho-orient-chinh-hang-c1\">Orient</a></td><td><strong>Xuất xứ: </strong>Nhật</td></tr><tr><td><strong>Đối tượng: </strong><a href=\"https://www.watchstore.vn/dong-ho-nam-chinh-hang-c1\">Nam</a></td><td><strong>Dòng sản phẩm: </strong><a href=\"https://www.watchstore.vn/dong-ho-orient-sk-chinh-hang-c1\">Orient SK</a></td></tr><tr><td><strong>Kháng nước: </strong>5atm</td><td><strong>Loại máy: </strong>Cơ</td></tr><tr><td><strong>Chất liệu kính: </strong>Kính Khoáng</td><td><strong>Chất liệu dây: </strong>Dây Kim Loại</td></tr><tr><td><strong>Size mặt: </strong>42mm</td><td><strong>Độ dầy: </strong>12.6mm</td></tr><tr><td><strong>Khoảng trữ cót: </strong>40 tiếng</td><td><strong>Tiện ích: </strong>Dạ quang, Lịch thứ, Lịch ngày, Giờ, phút, giây</td></tr></tbody></table></figure><p><br>&nbsp;</p>', '<p>Chính hãng từ: <strong>Orient</strong> - Xuất xứ: <strong>Nhật</strong></p>', 1),
(18, 6, 'Tua Vít Thép Mechanic MT Kích Thước 22x114MM', 'Tuavit.webp', 100, 0, 185000, 175000, '2023-11-20 23:20:33', 2, '<p>- Thương hiệu: Anasa</p><p>- Sản phẩm có nhiều phân loại quý khách vui lòng chọn đúng phân loại khi mua hàng.</p><p>- Màu sắc sản phẩm: Màu Đen</p><p>- Kích thước sản phẩm: 22x114MM</p><p>- Trọng lượng sản phẩm:43G</p><p>- Chất liệu sản phẩm: Thép cacbon không gỉ</p><p>&nbsp;</p>', '<p>Nhà sản xuất: <strong>Anasa</strong> &nbsp; Xuất xứ: <strong>Trung Quốc</strong></p>', 1),
(20, 2, 'iPhone 15 Pro Max', 'iPhone15ProMax.jpg', 100, 0, 30990000, 29990000, '2023-11-20 23:31:04', 10, '<p><strong>Màn hình</strong>: 6.7 inch Super Retina XDR OLED, 120Hz (ProMotion)</p><p><strong>Chip</strong>: Apple A17 Pro (3nm, hiệu suất mạnh, hỗ trợ ray tracing)</p><p><strong>RAM</strong>: 8GB</p><p><strong>Bộ nhớ trong</strong>: 256GB / 512GB / 1TB</p><p><strong>Camera sau</strong>: 48MP chính + 12MP góc rộng + 12MP tele 5X quang học</p><p><strong>Camera trước</strong>: 12MP, hỗ trợ Face ID</p><p><strong>Pin</strong>: 4422 mAh, sạc nhanh USB-C</p><p><strong>Hệ điều hành</strong>: iOS 17</p>', '<p>Nhà sản xuất : <strong>Apple&nbsp;</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Xuất xứ: <strong>Mỹ</strong></p>', 1),
(21, 19, 'LÒ VI SÓNG TOSHIBA MW2-MM20P', 'Lovisong.jpg', 100, 0, 1856000, 1350000, '2023-11-23 09:54:06', 4, '<h2>Khuyến mãi cho LÒ VI SÓNG TOSHIBA MW2-MM20P(WH)</h2><figure class=\"table\"><table><tbody><tr><td>Thương hiệu</td><td>Toshiba (Nhật Bản)</td></tr><tr><td>Mã sản phẩm</td><td>MW2-MM20P(WH)</td></tr><tr><td>Loại lò</td><td>Lò vi sóng không nướng</td></tr><tr><td>Công suất</td><td>700W</td></tr><tr><td>Dung tích</td><td>20L</td></tr><tr><td>Bảng điều khiển</td><td>Núm vặn</td></tr><tr><td>Chất liệu</td><td>Cửa lò: Kính cường lực/ Khoang lò: Tráng men cao cấp</td></tr><tr><td>Số mức công suất</td><td>5 mức</td></tr><tr><td>Chức năng chính</td><td>Nấu - Hâm - Rã đông</td></tr><tr><td>Hẹn giờ</td><td>Lên đến 35 phút</td></tr><tr><td>Tính năng khác</td><td>Chống thấm 3 lớp</td></tr><tr><td>&nbsp;</td><td>Kháng khuẩn bên trong lò</td></tr><tr><td>&nbsp;</td><td>Đèn trong khoang lò</td></tr><tr><td>Xuất xứ</td><td>Trung Quốc</td></tr><tr><td>Bảo hành</td><td>12 tháng</td></tr></tbody></table></figure>', '<p>Nhà sản xuất: <strong>Toshiba</strong> &nbsp; Xuất xứ: <strong>Trung Quốc</strong></p>', 1),
(23, 19, 'Máy Lạnh Âm Trần AF-50C', 'Mayamtran.jpg', 97, 3, 8560000, 6660000, '2023-11-23 12:19:16', 5, '<p>Công suất 5 Hp (50000Btu/h).</p><p><a href=\"https://alaska.vn/may-lanh\">Máy lạnh</a> âm trần dễ dàng lắp đặt.</p><p>Tận dụng tối đa khoảng trống trên trần nhà.</p><p>Làm mát bao quát mọi góc nhỏ của căn phòng.</p><p>Gam màu tươi sáng, thiết kế tinh tế, sang trọng.</p><p>Có tính năng khử mùi, hút ẩm.</p><p>Sử dụng Gas R410A.</p>', '<p>Nhà sản xuất: <strong>Samsung</strong> &nbsp; Xuất xứ:<strong> Hàn Quốc</strong></p>', 1),
(24, 19, 'ĐIỀU HOÀ DAIKIN 12.000BTU 2 CHIỀU INVETER GAS R410', 'Dieuhoa.jpg', 100, 2, 8000000, 7850000, '2023-11-23 12:20:16', 4, '<p><strong>Giới thiệu</strong></p><p>&nbsp; &nbsp; Điều hòa nhật bãi&nbsp;Daikin 12.000BTU với 2 chiều sưởi ấm và làm lạnh, công nghệ inverter tiết kiệm điện. Máy hoạt động siêu êm, chức năng làm lạnh không khô, hút ẩm, quạt gió, điều chỉnh nhiệt độ, thiết lập thời gian, chế độ hoạt động...</p><p><strong>Tính năng nổi bật</strong></p><ul><li>Công suất 12.000BTU (lắp phòng từ 20 mét vuông)</li><li>Hai chiều sưởi ấm và làm lạnh</li><li>Inverter siêu&nbsp;tiết kiệm điện</li><li>Làm lạnh không khô, sưởi ấm êm dịu tự nhiên</li><li>Thiết lập thời gian hẹn giờ, tùy chọn nhiều chế độ làm việc</li><li>Chức năng hút ẩm, quạt gió, khử mùi và diệt khuẩn</li></ul><p><strong>Thông số từ nhà sản xuất</strong></p><ul><li>Điện nguồn 100V</li><li>Công suất tiêu thụ 900W</li><li>Tương thích với phòng 20 mét vuông</li></ul><p><strong>Tình trạng sản phẩm :</strong></p><p><strong>- Nguyên bản 100% cam kết chưa qua sửa chữa&nbsp;</strong></p><p><strong>- Độ mới : 85-90%&nbsp;</strong></p>', '<p>Nhà sản xuất: <strong>Daikin</strong> &nbsp; Xuất xứ: <strong>Trung Quốc</strong></p>', 1),
(25, 4, 'MacBook Pro M2 Pro 14 inch 2023', 'MacBookM2.jpg', 100, 0, 32000000, 28900000, '2023-11-23 16:21:03', 17, '<p><strong>Màn hình:</strong> 14.2 inch Liquid Retina XDR, độ phân giải 3024 x 1964, tấm nền mini-LED, độ sáng tối đa 1600 nits (HDR), hỗ trợ ProMotion 120Hz, dải màu P3</p><p><strong>CPU:</strong> Apple M2 Pro, 10 lõi (6 hiệu năng + 4 tiết kiệm điện), xung nhịp tối đa 3.49GHz</p><p><strong>GPU:</strong> 16 lõi, xử lý đồ họa mạnh mẽ, hỗ trợ tăng tốc phần cứng</p><p><strong>RAM:</strong> 16GB Unified Memory, băng thông 200GB/s</p><p><strong>Bộ nhớ trong:</strong> 512GB SSD PCIe Gen 4 (tùy chọn nâng cấp lên 1TB hoặc 2TB)</p><p><strong>Camera:</strong> 1080p FaceTime HD, hỗ trợ Center Stage</p><p><strong>Pin:</strong> 70Wh, thời lượng sử dụng lên đến 18 giờ phát video, hỗ trợ sạc nhanh với adapter 67W hoặc 96W</p><p><strong>Hệ điều hành:</strong> macOS Ventura (hỗ trợ nâng cấp lên các phiên bản macOS mới nhất)</p>', '<p>Nhà sản xuất:<strong> Apple</strong> &nbsp; &nbsp; Xuất xứ: <strong>Mỹ</strong></p>', 1),
(26, 2, 'iPhone 16 Pro Max', 'iPhone16ProMax.jpg', 98, 4, 34990000, 30590000, '2023-11-23 16:23:55', 41, '<p><strong>Màn hình</strong>: 6.3 inch Super Retina XDR OLED, 120Hz</p><p><strong>Chip</strong>: Apple A18 Pro (3nm, hiệu năng AI mạnh)</p><p><strong>RAM</strong>: 8GB</p><p><strong>Bộ nhớ trong</strong>: 128GB / 256GB / 512GB / 1TB</p><p><strong>Camera sau</strong>: 48MP chính + 12MP góc rộng + Tele 5X</p><p><strong>Camera trước</strong>: 12MP, hỗ trợ Face ID</p><p><strong>Pin</strong>: 3300 mAh, sạc nhanh USB-C</p><p><strong>Hệ điều hành</strong>: iOS 18</p>', '<p>Nhà sản xuất : <strong>Apple&nbsp;</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Xuất xứ: <strong>Mỹ</strong></p>', 1),
(27, 4, 'Lenovo Yoga Slim', 'Lenovo.jpg', 87, 18, 37990000, 36990000, '2023-11-23 20:31:17', 7, '<p><strong>Màn hình:</strong> 14 inch WUXGA (1920 x 1200), tấm nền IPS, tỷ lệ 16:10, độ sáng 300 nits, chống chói</p><p><strong>CPU:</strong> Intel Core i5-1340P (12 nhân, 16 luồng, xung nhịp tối đa 4.6GHz, bộ nhớ đệm 12MB)</p><p><strong>RAM:</strong> 16GB LPDDR5 5200MHz (hàn trên main, không nâng cấp)</p><p><strong>Bộ nhớ trong:</strong> 512GB SSD M.2 PCIe Gen 4</p><p><strong>GPU:</strong> Intel Iris Xe Graphics tích hợp</p><p><strong>Bàn phím:</strong> Có đèn nền, layout tiêu chuẩn, hành trình phím tốt</p><p><strong>Pin:</strong> 4-cell 65Wh, hỗ trợ sạc nhanh</p><p><strong>Hệ điều hành:</strong> Windows 11 Home bản quyền</p><p>&nbsp;</p>', '<p>Nhà sản xuất: <strong>Lenovo</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Xuất xứ:<strong> Trung Quốc</strong></p>', 1),
(28, 16, 'Cặp Loa 4Ohm 3W 5cm Có Tai - 2 Cái', 'Caploa.webp', 98, 4, 150000, 86000, '2023-11-29 20:36:43', 19, '<p>- Trở kháng loa: 4 Ohm.</p><p>- Công suất loa: 3W.</p><p>- Đường kính củ loa: 50mm.</p><p>- Đường chéo lỗ bắt vít: 61mm (chi tiết như trên hình ảnh sản phẩm).</p><p>- Khối lượng: 70g/cái.</p>', '<p>Nhà sản xuất: <strong>Anasa</strong> &nbsp; &nbsp; Xuất xứ: <strong>Việt Nam</strong></p>', 1),
(29, 4, 'Laptop Gaming HP VICTUS', 'HP.jpg', 100, 0, 37990000, 29990000, '2023-12-02 20:54:53', 13, '<p><strong>Màn hình:</strong> 15.6 inch Full HD (1920 x 1080), tấm nền IPS, tần số quét 144Hz, chống chói, viền mỏng</p><p><strong>CPU:</strong> Intel Core i5-12450H (8 nhân, 12 luồng, xung nhịp tối đa 4.4GHz, bộ nhớ đệm 12MB)</p><p><strong>RAM:</strong> 16GB DDR4 3200MHz (2 khe, hỗ trợ nâng cấp tối đa 32GB)</p><p><strong>Ổ cứng:</strong> 512GB SSD M.2 PCIe Gen 4.0</p><p><strong>GPU:</strong> NVIDIA GeForce RTX 2050 4GB GDDR6</p><p><strong>Bàn phím:</strong> Bàn phím có đèn nền</p><p><strong>Pin:</strong> 3-cell 52.5Wh</p><p><strong>Hệ điều hành:</strong> Windows 11 Home bản quyền</p>', '<p>Nhà sản xuất: <strong>HP</strong> &nbsp; &nbsp; Xuất xứ: <strong>Hàn Quốc</strong></p>', 1),
(30, 4, 'Laptop Dell XPS 13 9350 71058714', 'Dell.jpg', 100, 6, 60990000, 54990000, '2023-12-02 20:56:21', 23, '<p><strong>Màn hình:</strong> 13.4 inch QHD+ (2560 x 1600), cảm ứng, tần số quét 120Hz, độ sáng 500 nits, công nghệ InfinityEdge, chống chói, hỗ trợ Eyesafe</p><p><strong>CPU:</strong> Intel Core Ultra 5 226V (8 nhân, 8 luồng, xung nhịp cơ bản 2.1GHz, tối đa 4.5GHz, bộ nhớ đệm 8MB)</p><p><strong>RAM:</strong> 16GB LPDDR5X 8533MHz (onboard, không nâng cấp)</p><p><strong>Ổ cứng:</strong> 1TB SSD M.2 PCIe NVMe 2230</p><p><strong>GPU:</strong> Intel Arc Graphics tích hợp</p><p><strong>Cổng kết nối:</strong> 2 x Thunderbolt 4 (USB-C hỗ trợ DisplayPort 2.1 và Power Delivery), jack âm thanh 3.5mm</p><p><strong>Kết nối không dây:</strong> Intel Killer Wi-Fi 7 (BE201) 2x2, Bluetooth 5.4</p><p><strong>Pin:</strong> 3-cell 55Wh</p><p><strong>Hệ điều hành:</strong> Windows 11 Home + Office Home &amp; Student 2024 bản quyền</p><p><strong>Trọng lượng:</strong> 1.22 kg</p><p><strong>Màu sắc:</strong> Graphite (xám đậm)</p><p><strong>Chất liệu:</strong> Vỏ nhôm nguyên khối</p>', '<p>Nhà sản xuất: <strong>Dell</strong> &nbsp; Xuất xứ: <strong>Trung Quốc</strong></p>', 1),
(31, 6, 'Củ Sạc Điện Thoại C73 Sạc Nhanh Điện Thoại 5V 2A 2 Cổng USB 10W Đa Màu Sáng Bóng 747576', 'Capxacxanh.webp', 98, 24, 58000, 46000, '2023-12-02 20:59:06', 43, '<p>- Màu sắc : Ngẫu nhiên</p><p>- Công suất tối đa: 10W</p><p>- Điện áp đầu vào : 220VCC</p><p>- Điện áp ra: 5VDC&nbsp;</p><p>- Tích hợp 2 cổng sạc tiện lợi</p><p>- Giao thức sạc: QC2.0</p><p>- Đầu ra 2 cổng USB</p><p>- Chất liệu nhựa ABS</p><p>- Dòng điện tối đa 2A</p>', '<p>Nhà sản xuất: <strong>Xiaomi</strong> &nbsp; &nbsp;Xuất xứ: <strong>Trung Quốc</strong></p>', 1),
(32, 16, 'Combo Bộ KIT Học Tập Arduino Uno R3 V1', 'Kit.webp', 100, 69, 385000, 296000, '2023-12-02 21:00:48', 79, '<p>Danh sách linh kiện:</p><p>1. Arduino UNO R3 chip dán (giao tiếp CH340): 1</p><p>2. Cable USB (Cáp truyền dữ liệu Arduino): 1</p><p>3. 74HC595: 1</p><p>4. LED 5mm đỏ: 5</p><p>5. LED 5mm xanh: 5</p><p>6. LED 5mm vàng: 5</p><p>7. Động cơ servo SG90: 1</p><p>8. LED 7 thanh 1 digit: 1</p><p>9. LED 7 thanh 4 digit: 1</p><p>10. Biến trở 10K: 1</p><p>11. Cảm biến rung SW520D: 1</p><p>12. Điện trở từ 1k-10K, 220, 330 Ohm: Mỗi loại 10</p><p>13. Jack cắm 2.54mm: 1 thanh x 40</p><p>14. Module RFID: 1</p><p>15. LM35: 1</p><p>16. Nút nhấn (Key switch): 4</p><p>17. Loa Bit (Passive Buzzer): 1</p><p>18. Dây cắm cho board test: 1 bó</p><p>19. Động cơ bước 5V: 1</p><p>20. Driver Stepmotor: 1</p><p>21. Mắt thu hồng ngoại 3 chân: 1</p><p>22. LCD 1602: 1</p><p>23. Dây cắm 2 đầu đực cái: 20 sợi</p><p>24. Cảm biến ánh sáng Cds: 2</p><p>25. Board test loại to: 1</p><p>26. Module thời gian: 1</p><p>27. Remote control: 1</p><p>28. Module Cảm biến âm thanh: 1</p><p>29. Module Relay 1 kênh: 1</p><p>30. LED phát hồng ngoại: 1</p><p>31. LED matrix 8x8: 1</p><p>32. Module Cảm biến mực nước: 1</p><p>33. Active Buzzer: 1</p><p>34. Dây đế pin 9V: 1</p><p>35. Module điều khiển Led RGB: 1</p><p>36. Module chuyển đổi giao tiếp I2C: 1</p><p>37. Lcd 16x2: 1</p><p>38. Led thu - phát hồng ngoại phi 5: 1 cặp</p><p>39. Module JOYSTICK PS2: 1</p><p>40. Bàn Phím Ma Trận 4x4 V2: 1</p><p>41. Module điều khiển động cơ bước ULN2003: 1</p><p>42. Module&nbsp;cảm biến nhiệt độ - độ ẩm DHT11: 1</p><p>43. Cảm biến nhiệt độ LM35: 1</p><p>44. Cảm biến IR1838: 1</p>', '<p>Nhà sản xuất: <strong>Anasa &nbsp;</strong> &nbsp; Xuất xứ: <strong>Việt Nam</strong></p>', 1),
(37, 2, 'Samsung Galaxy S25 Ultra', 'SamsungS25Ultra.jpg', 100, 0, 33490000, 29590000, '2025-06-01 20:41:20', 1, '<p><strong>Màn hình</strong>: 6.8 inch AMOLED 2X, Quad HD+, 1–120Hz LTPO</p><p><strong>Chip</strong>: Snapdragon 8 Gen 4 (4nm, hiệu năng cao, AI mạnh)</p><p><strong>RAM</strong>: 12GB / 16GB</p><p><strong>Bộ nhớ trong</strong>: 256GB / 512GB / 1TB (UFS 4.0)</p><p><strong>Camera sau</strong>: 200MP chính + 12MP góc rộng + 50MP tele 5X + 50MP tele 3X</p><p><strong>Camera trước</strong>: 12MP, quay 4K, hỗ trợ AI selfie</p><p><strong>Pin</strong>: 5500 mAh, sạc nhanh 45W, sạc không dây và ngược</p><p><strong>Hệ điều hành</strong>: Android 15 + One UI 7.0</p>', '<p>Nhà sản xuất: <strong>Samsung</strong> &nbsp; &nbsp; &nbsp;Xuất xứ: <strong>Hàn Quốc</strong></p>', 1),
(38, 4, 'Acer Nitro 5 Tiger (AN515-58)', 'Acer.jpg', 100, 0, 31250000, 23458000, '2025-06-01 21:03:15', 1, '<p><strong>Màn hình:</strong> 15.6 inch IPS Full HD (1920 x 1080), 144Hz, viền mỏng, chống chói</p><p><strong>CPU:</strong> Intel Core i5-12500H (12 nhân, 16 luồng, tối đa 4.5GHz)</p><p><strong>RAM:</strong> 8GB DDR4 3200MHz (2 khe, nâng cấp tối đa 32GB)</p><p><strong>Bộ nhớ trong:</strong> 512GB SSD M.2 PCIe Gen 4 (hỗ trợ nâng cấp thêm 1 khe SSD + 1 khe HDD)</p><p><strong>GPU:</strong> NVIDIA GeForce RTX 3050 4GB GDDR6 (hỗ trợ ray tracing, DLSS)</p><p><strong>Bàn phím:</strong> LED RGB 4 vùng, hành trình phím sâu, phím NitroSense riêng</p><p><strong>Pin:</strong> 4-cell 57.5Wh, thời lượng khoảng 4–6 giờ tùy tác vụ</p><p><strong>Hệ điều hành:</strong> Windows 11 Home bản quyền theo máy</p>', '<p>Nhà sản xuất:<strong> Acer</strong> &nbsp; &nbsp; Xuất xứ: <strong>Mỹ</strong></p>', 1),
(39, 4, 'MacBook Pro 14 inch 2024 M4', 'MacbookPro.jpg', 100, 0, 49589000, 45500000, '2025-06-01 21:05:16', 2, '<p><strong>Màn hình:</strong> 14.2 inch Liquid Retina XDR, mini-LED, độ phân giải 3024 x 1964, 120Hz ProMotion, độ sáng HDR 1600 nits<br><strong>Chip:</strong> Apple M4 (3nm, 10 lõi CPU gồm 4 hiệu năng + 6 tiết kiệm điện, hỗ trợ ray tracing và AI tăng tốc)<br><strong>RAM:</strong> 16GB Unified Memory (tùy chọn nâng cấp lên 32GB)<br><strong>Bộ nhớ trong:</strong> 512GB / 1TB SSD (tùy chọn nâng cấp lên 2TB)<br><strong>GPU:</strong> 10 lõi tích hợp (Apple GPU, hỗ trợ Metal 3 và ray tracing phần cứng)<br><strong>Camera:</strong> 12MP FaceTime HD, hỗ trợ Center Stage<br><strong>Pin:</strong> lên đến 22 giờ phát video, sạc nhanh qua cổng MagSafe 3<br><strong>Hệ điều hành:</strong> macOS Sonoma (mặc định khi xuất xưởng, hỗ trợ nâng cấp các bản mới)</p>', '<p>Nhà sản xuất:<strong> Apple</strong> &nbsp; &nbsp;Xuất xứ: <strong>Mỹ</strong></p>', 1),
(40, 6, 'Bộ 6 Tua Vít 6 Màu', 'Bovan.webp', 100, 0, 35000, 28000, '2025-06-01 21:15:56', 0, '<p>- Thương hiệu: Paishi</p><p>- Sản phẩm có nhiều phân loại quý khách vui lòng chọn đúng phân loại khi mua hàng.</p><p>- Màu sắc sản phẩm: Bộ sản phẩm đủ 6 màu như hình ảnh</p><p>- Bộ sản phẩm gồm 6 tua vít và 1 hộp nhựa đựng tua vít</p><p>- Trọng lượng bộ sản phẩm: 68G</p><p>- Kích thước hộp đựng khoảng: 6x10Cm</p>', '<p>Nhà sản xuất: <strong>Paishi</strong> &nbsp; &nbsp;Xuất xứ: <strong>Trung Quốc</strong></p>', 1),
(41, 6, 'Tai nghe bluetooth chụp tai P47', 'Tainghe.webp', 100, 0, 109000, 52000, '2025-06-01 21:18:16', 1, '<p><strong>Màn hình:</strong> Không áp dụng</p><p><strong>Kết nối:</strong> Bluetooth 4.2 + EDR, hỗ trợ kết nối không dây với khoảng cách tối đa 10 mét</p><p><strong>Chất liệu:</strong> Nhựa ABS, thiết kế gập gọn, trọng lượng khoảng 300g</p><p><strong>Thời lượng pin:</strong> Thời gian nghe nhạc liên tục khoảng 6 giờ, thời gian chờ lên đến 15 giờ</p><p><strong>Tính năng bổ sung:</strong> Hỗ trợ khe cắm thẻ nhớ MicroSD (tối đa 32GB), tích hợp FM radio, jack cắm 3.5mm</p><p><strong>Màu sắc:</strong> Đen, Trắng, Xanh, Đỏ, Xanh lá</p><p><strong>Giá tham khảo:</strong> Khoảng 99.000₫</p><p><strong>Phụ kiện đi kèm:</strong> 1 tai nghe, 1 dây audio 3.5mm, 1 cáp sạc</p>', '<p>Nhà sản xuất: <strong>Delibili</strong> &nbsp; Xuất xứ: <strong>Trung Quốc</strong></p>', 1),
(42, 6, 'Giá Đỡ Điện Thoại LG Lục Giác', 'Giado.webp', 100, 0, 70000, 59000, '2025-06-01 21:20:52', 1, '<p>- Thương hiệu: Paishi</p><p>- Sản phẩm có nhiều phân loại quý khách vui lòng chọn đúng phân loại khi mua hàng.</p><p>- Màu sắc sản phẩm: Màu đen- vàng- bạc quý khách lựa chọn theo phân loại màu</p><p>- Kích thước sản phẩm: 3.5x55x55MM</p><p>- Chất liệu sản phẩm: Kim loại thép</p><p>- Giá đỡ điện thoại có tính năng xoay gập 360 độ&nbsp; tiện lợi</p><p>- Trọng lượng giá đỡ điện thoại là : 45G</p><p>- Giá đỡ điện thoại có băng dính 2 mặt siêu dính khi cố định vào điện thoại</p>', '<p>Nhà sản xuất:<strong> An Nam</strong> &nbsp; Xuất xứ: <strong>Việt Nam</strong></p>', 1),
(43, 6, 'Bộ Củ Sạc Và Cáp Sạc Điện Thoại NOV Đầu Ra 20W', 'Capxac.webp', 100, 0, 100000, 80000, '2025-06-01 21:22:24', 2, '<p>- Thương hiệu: Paishi</p><p>- Sản phẩm có nhiều phân loại quý khách vui lòng chọn đúng phân loại khi mua hàng.</p><p>- Màu sắc sản phẩm: Màu trắng</p><p>- Cáp sạc dài 1 Mét</p><p>- Củ sạc và cáp sạc màu trắng</p><p>- Đầu sạc chuẩn sạc siêu nhanh</p><p>- Công suất tối đa 30W</p>', '<p>Nhà sản xuất: <strong>Beaus</strong> &nbsp; Xuất xứ: <strong>Trung Quốc</strong></p>', 1),
(44, 16, 'Màn Hình LCD OLED 1.3 Inch', 'Manhinhled.webp', 100, 0, 500000, 380000, '2025-06-01 21:43:31', 0, '<p>- Điện áp sử dụng: 2.2 - 5.5VDC.</p><p>- Công suất tiêu thụ: 0.04W.</p><p>- Góc hiển thị: lớn hơn 160 độ.</p><p>- Số điểm hiển thị: 128 x 64 điểm.</p><p>- Độ rộng màn hình: 1.3 inch.</p><p>- Màu hiển thị: trắng/ xanh dương.</p><p>- Giao tiếp: I2C.</p><p>- Driver: SH1106.</p>', '<p>Nhà sản xuất: <strong>Anasa</strong> &nbsp; &nbsp; Xuất xứ: <strong>Việt Nam</strong></p>', 1),
(45, 16, 'Module Điều Khiển Động Cơ Bước TB6600 4A 9V-42VDC', 'Module.webp', 96, 4, 200000, 186000, '2025-06-01 21:44:44', 1, '<p>- Nguồn đầu vào là 9V - 42V.</p><p>- Dòng cấp tối đa là 4A.</p><p>- Ngõ vào có cách ly quang, tốc độ cao.</p><p>- Có tích hợp đo quá dòng quá áp. &nbsp;</p><p>- Trọng lượng: 200G.</p><p>- Kích thước : 96 x 71 x 37mm.</p><p>- Cài đặt và ghép nối:</p><p>&nbsp; + DC+: Nối với nguồn điện từ 9 - 40VDC.</p><p>&nbsp; + DC-: Điện áp (-) âm của nguồn.</p><p>&nbsp; + A+ và A-: Nối vào cặp cuộn dây của động cơ bước.</p><p>&nbsp; + B+ và B-: Nối với cặp cuộn dây còn lại của động cơ.</p><p>&nbsp; + PUL+: Tín hiệu cấp xung điều khiển tốc độ (+5V) từ BOB cho M6600.</p><p>&nbsp; + PUL-: Tín hiệu cấp xung điều khiển tốc độ (-) từ BOB cho M6600.</p><p>&nbsp; + DIR+: Tín hiệu cấp xung đảo chiều (+5V) từ BOB cho M6600.</p><p>&nbsp; + DIR-: Tín hiệu cấp xung đảo chiều (-) từ BOB cho M6600.</p><p>&nbsp; + ENA+ và ENA -: khi cấp tín hiệu cho cặp này động cơ sẽ không có lực momen giữ và quay nữa.</p>', '<p>Nhà sản xuất: <strong>Anasa &nbsp;</strong> &nbsp; Xuất xứ: <strong>Việt Nam</strong></p>', 1),
(46, 16, 'Tụ MMKP82 223J 2000V 2KV Điện Trở Điện Áp Cao 2 Mặt Kim Loại', 'Tudien.jpg', 96, 4, 15000, 12000, '2025-06-01 21:46:21', 6, '<p>- Thương hiệu: Anasa</p><p>- Sản phẩm có nhiều phân loại quý khách vui lòng chọn đúng phân loại khi mua hàng.</p><p>- Màu sắc sản phẩm: Màu đen</p><p>- Chất liệu sản phẩm:&nbsp;Màng polypropylene kim loại hóa hai mặt</p><p>- Công suất: 223J-2000V</p><p>- Hàng chính hãng:&nbsp;MMKP82</p><p>- Phạm vi nhiệt độ :&nbsp;40℃~110℃</p><p>- Kích thước sản phẩm:&nbsp;32*18*9MM</p>', '<p>Nhà sản xuất: <strong>Anasa&nbsp;</strong> &nbsp; &nbsp;Xuất xứ: <strong>Việt Nam</strong></p>', 1),
(47, 16, 'Quạt Tản Nhiệt', 'Quattannhiet.webp', 98, 2, 25000, 18500, '2025-06-01 21:49:23', 4, '<p>- Thương hiệu: Anasa</p><p>- Sản phẩm có nhiều phân loại quý khách vui lòng chọn đúng phân loại khi mua hàng.</p><p>- Màu sắc sản phẩm: Màu đen</p><p>- Chất liệu sản phẩm: Nhựa ABS</p><p>- Công suất quạt : 0.12A</p><p>- Điện áp sản phẩm: 5VDC</p><p>- Kích thước sản phẩm: 4x4x1CM</p>', '<p>Nhà sản xuất:<strong>Anasa &nbsp;&nbsp;</strong> Xuất xứ: <strong>Việt Nam</strong></p>', 1),
(48, 19, 'Máy Lọc Nước', 'Maylocnuoc.jpg', 94, 6, 18560000, 16000000, '2025-06-01 21:53:45', 2, '<ul><li><strong>Kiểu lắp đặt:</strong>Tủ đứng</li><li><strong>Loại máy:</strong>Máy lọc nước RO nóng nguội lạnh</li><li><strong>Công nghệ lọc:</strong><a href=\"https://www.dienmayxanh.com/kinh-nghiem-hay/may-loc-nuoc-ro-la-gi-989950\">Thẩm thấu ngược RO</a></li><li><strong>Kháng khuẩn:</strong>Nano Silver</li><li><strong>Dung tích bình chứa:</strong>Tổng 11.5 lít (Nước nóng 1.5 lít, nước lạnh 2 lít, nước thường 8 lít)</li><li><strong>Tỷ lệ lọc - thải:</strong>Lọc 4 - Thải 6 (Tỷ lệ này phụ thuộc vào chất lượng nước đầu vào)</li><li><strong>Công suất lọc:</strong>10 - 15 lít/giờ</li><li><strong>Công suất tiêu thụ điện trung bình khoảng:</strong>0.675 kW/h</li><li><strong>Nhiệt độ nước hãng công bố:</strong>Nóng 85 - 95°C, Lạnh 6 - 10°C</li><li><strong>Nhiệt độ nước thực tế:</strong>Nóng 80 - 90°C, Lạnh 8 - 12°C, Nhiệt độ nước thực tế sẽ phụ thuộc vào nhiệt độ môi trường và thể tích nước lấy ra</li><li><strong>Áp lực nước yêu cầu:</strong>&gt; 3 psi</li><li><strong>Nơi sản xuất máy bơm:</strong>Trung Quốc</li><li><strong>Năm ra mắt:</strong>2024</li><li><strong>Thương hiệu:</strong>Việt Nam</li><li><strong>Nơi sản xuất:</strong>Việt Nam</li></ul>', '<p>Nhà sản xuất: <strong>Việt Nam </strong>Xuất xứ: <strong>Việt Nam</strong></p>', 1),
(49, 17, 'Đồng Hồ Casio Nam AE-1200WHD-1AVDF', 'CasioTrang.webp', 79, 21, 1560000, 1284000, '2025-06-01 22:02:24', 2, '<figure class=\"table\"><table><tbody><tr><td><strong>Thương hiệu: </strong><a href=\"https://www.watchstore.vn/dong-ho-casio-chinh-hang-c1\">Casio</a></td><td><strong>Xuất xứ: </strong>Nhật</td></tr><tr><td><strong>Đối tượng: </strong><a href=\"https://www.watchstore.vn/dong-ho-nam-chinh-hang-c1\">Nam</a></td><td><strong>Kháng nước: </strong>10atm</td></tr><tr><td><strong>Loại máy: </strong>Pin/Quartz</td><td><strong>Chất liệu kính: </strong>Kính Nhựa</td></tr><tr><td><strong>Chất liệu dây: </strong>Dây Thép Không Gỉ</td><td><strong>Size mặt: </strong>45 x 42.1 mm</td></tr><tr><td><strong>Độ dầy: </strong>12.5mm</td><td><strong>Series: </strong>Casio AE1200</td></tr></tbody></table></figure>', '<p>Nhà sản xuất: <strong>Casio</strong> &nbsp; &nbsp; Xuất xứ: <strong>Nhật Bản</strong></p>', 1),
(50, 17, 'Đồng hồ Casio MTP', 'CasioMTP.webp', 84, 16, 2270000, 1780000, '2025-06-01 22:03:40', 10, '<figure class=\"table\"><table><tbody><tr><td><strong>Thương hiệu: </strong><a href=\"https://www.watchstore.vn/dong-ho-casio-chinh-hang-c1\">Casio</a></td><td><strong>Xuất xứ: </strong>Nhật</td></tr><tr><td><strong>Đối tượng: </strong><a href=\"https://www.watchstore.vn/dong-ho-nam-chinh-hang-c1\">Nam</a></td><td><strong>Dòng sản phẩm: </strong><a href=\"https://www.watchstore.vn/dong-ho-casio-mtp-chinh-hang-c1\">Casio MTP</a></td></tr><tr><td><strong>Kháng nước: </strong>5atm</td><td><strong>Loại máy: </strong>Pin/Quartz</td></tr><tr><td><strong>Chất liệu kính: </strong>Kính Khoáng</td><td><strong>Chất liệu dây: </strong>Dây Da</td></tr><tr><td><strong>Size mặt: </strong>43.5mm</td><td><strong>Độ dầy: </strong>10.4mm</td></tr><tr><td><strong>Series: </strong>Casio MTP 1374</td><td><strong>Tiện ích: </strong>Dạ quang, Lịch thứ, Lịch ngày, Giờ, phút, giây, Lịch 24 giờ</td></tr></tbody></table></figure>', '<p>Nhà sản xuất: <strong>Casio &nbsp; &nbsp;</strong> Xuất xứ: <strong>Nhật Bản</strong></p>', 1),
(51, 19, 'Máy giặt Samsung Inverter 9.5kg', 'Maygiat.jpg', 61, 39, 10990000, 8500000, '2025-06-01 22:05:17', 21, '<figure class=\"table\"><table><tbody><tr><td>Bảo hành</td><td>2 năm (Bảo hành động cơ 20 năm)</td></tr><tr><td>Lồng giặt</td><td>Lồng ngang</td></tr><tr><td>Khối lượng giặt</td><td>9.5 Kg</td></tr><tr><td>Tốc độ quay vắt</td><td>1400 vòng/phút</td></tr><tr><td>Inverter</td><td>Có</td></tr><tr><td>Kiểu động cơ</td><td>Dây Curoa</td></tr><tr><td>Công nghệ giặt</td><td>VRT Plus ™ giảm rung ồn đến 30%, Giặt hơi nước Hygiene Steam, Công nghệ giặt bong bóng Eco Bubble</td></tr><tr><td>Chất liệu lồng giặt</td><td>Thép không gỉ</td></tr><tr><td>Chất liệu vỏ máy</td><td>Thép chống gỉ</td></tr><tr><td>Chất liệu cửa máy</td><td>Nhựa</td></tr><tr><td>Bảng điều khiển</td><td>Tiếng Việt</td></tr><tr><td>Khoảng khối lượng giặt</td><td>Từ 9 - &lt; 10 Kg</td></tr><tr><td>Kích thước</td><td>Ngang 60 cm - Cao 85 cm - Sâu 55 cm</td></tr><tr><td>Trọng lượng</td><td>65 kg</td></tr></tbody></table></figure>', '<p>Nhà sản xuất: <strong>Samsung</strong> &nbsp;Xuất xứ:<strong> Trung Quốc</strong></p>', 1),
(52, 19, 'Tủ lạnh Samsung Inverter 488 lít RF48A4010B4/SV', 'Tulanh.jpg', 89, 11, 29390000, 22290000, '2025-06-01 22:06:25', 11, '<figure class=\"table\"><table><tbody><tr><td>Xuất xứ</td><td>Trung Quốc</td></tr><tr><td>Bảo hành</td><td>2 năm</td></tr><tr><td>Dung tích sử dụng</td><td>488 lít</td></tr><tr><td>Công nghệ bảo quản thực phẩm</td><td>Ngăn rau quả giữ ẩm</td></tr><tr><td>Dung tích ngăn đá</td><td>159 lít</td></tr><tr><td>Dung tích ngăn lạnh</td><td>329 lít</td></tr><tr><td>Công nghệ làm lạnh</td><td>2 dàn lạnh độc lập Twin Cooling Plus™</td></tr><tr><td>Số người sử dụng</td><td>4 - 5 người</td></tr><tr><td>Chế độ tiết kiệm điện</td><td>Digital Inverter</td></tr><tr><td>Khoảng dung tích</td><td>Từ 400 - 550 lít</td></tr><tr><td>Công nghệ Inverter</td><td>Tủ lạnh Inverter</td></tr><tr><td>Tiện ích</td><td>Lấy nước ngoài, Bảng điều khiển bên ngoài</td></tr><tr><td>Kiểu tủ</td><td>Multi Door</td></tr><tr><td>Chất liệu cửa tủ lạnh</td><td>Thép không gỉ</td></tr><tr><td>Chất liệu khay ngăn</td><td>Kính chịu lực</td></tr></tbody></table></figure>', '<p>Nhà sản xuất: <strong>Samsung</strong> &nbsp; Xuất xứ: <strong>Hàn Quốc</strong></p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL COMMENT 'Họ tên',
  `image` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là khách hàng 1 là nhân viên',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `image`, `email`, `phone`, `address`, `role`, `active`) VALUES
(8, 'admin', '$2y$10$Cm.2KiZ85WRGUTBk8vhMaOIQt46A53HKuzPfZh2jS.fdZzAr33dTi', 'Admin', 'user-default.png', 'admin@gmail.com', '0336216559', 'Cần Thơ', 1, 1),
(22, 'hwangseonit', '$2y$10$bCPcU5l1t/qugE2cLZ18m.//ZWnmFVGd4CkmXr2eR1s/BdPKQlzVO', 'Trần Văn Sơn', 'user-default.png', 'hoangsonvq1@gmail.com', '0979783601', 'Tòa A3 Vinhomes Gardenia', 0, 1),
(23, 'tranminhchienhvnh', '$2y$10$eKzeLPeGfSzRSw46U3rX1./iIkfs.sIcvSHVEDb97gUigr.2D8CtW', 'Trần Minh Chiến', 'user-default.png', '25a4041913@hvnh.edu.vn', '0896993231', 'Số 13 Chùa Bộc , Quận Đống Đa , Hà Nội', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sell` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
