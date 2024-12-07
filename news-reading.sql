-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 07, 2024 lúc 05:24 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `news-reading`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('admin@admin.com|127.0.0.1', 'i:1;', 1733542260),
('admin@admin.com|127.0.0.1:timer', 'i:1733542260;', 1733542260);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Kinh Tế'),
(2, 'Giải Trí'),
(3, 'Thể Thao'),
(4, 'Công Nghệ'),
(5, 'Xã Hội'),
(6, 'Chính Trị'),
(7, 'Giáo Dục'),
(8, 'Sức Khỏe'),
(9, 'Môi Trường'),
(10, 'Du Lịch'),
(11, 'Văn Hóa'),
(12, 'Khoa Học'),
(13, 'Âm Nhạc'),
(14, 'Phim Ảnh'),
(15, 'Ẩm Thực'),
(16, 'Tâm Lý'),
(17, 'Thời Trang'),
(18, 'Làm Đẹp'),
(19, 'Khởi Nghiệp'),
(20, 'Lịch Sử');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `category_id`, `created_at`, `deleted_at`) VALUES
(1, 'Tin tức Kinh tế ngày hôm nay', 'Đây là nội dung bài viết dài về kinh tế, bao gồm các xu hướng phát triển mới nhất, tác động của các chính sách kinh tế đến thị trường và các ngành công nghiệp. Đặc biệt, các yếu tố như lạm phát, thất nghiệp và đầu tư đều đang có ảnh hưởng lớn đến nền kinh tế toàn cầu. Các chuyên gia kinh tế nhận định rằng trong năm nay, các yếu tố này sẽ tiếp tục đóng vai trò quan trọng trong việc định hình tương lai kinh tế thế giới. Nội dung sẽ tiếp tục phát triển và đưa ra các giải pháp cho các vấn đề kinh tế hiện tại...', 'https://inkythuatso.com/uploads/thumbnails/800/2022/05/a732e392b657be4fceffdffd214e5e21-08-23-41-28.jpg', 1, '2024-12-04 10:27:05', NULL),
(2, 'Giải trí cuối tuần', 'Mỗi cuối tuần, mọi người đều mong đợi được thư giãn và tham gia vào các hoạt động giải trí như xem phim, nghe nhạc, chơi thể thao, hoặc tham gia vào các sự kiện lớn. Giải trí không chỉ giúp mọi người xả stress mà còn mở rộng tầm nhìn, tạo ra cơ hội để kết nối với bạn bè và gia đình. Bài viết này sẽ khám phá các hình thức giải trí phổ biến, những hoạt động phù hợp cho các nhóm bạn, và các địa điểm lý tưởng để thư giãn vào cuối tuần...', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy6INvffxN0FjMAExac2z26Cm8CHXKG3PoFg&s', 2, '2024-12-04 10:27:05', NULL),
(3, 'Thể thao hôm nay', 'Thể thao là một trong những lĩnh vực thu hút sự quan tâm của hàng triệu người trên thế giới, với các sự kiện thể thao lớn như World Cup, Olympic, NBA, và các giải đấu quốc tế khác. Bài viết này sẽ cập nhật những diễn biến mới nhất về các môn thể thao hàng đầu, phân tích những chiến thuật, chiến lược và sự tiến bộ của các vận động viên nổi tiếng. Ngoài ra, chúng ta cũng sẽ tìm hiểu về các môn thể thao ít phổ biến nhưng đầy thú vị...', 'https://inkythuatso.com/uploads/thumbnails/800/2022/05/www-tiengdong-com-meme-meo-tuc-gian-08-23-45-30.jpg', 3, '2024-12-04 10:27:05', NULL),
(4, 'Công nghệ 4.0', 'Công nghệ 4.0 là cuộc cách mạng công nghiệp mới, mang lại nhiều thay đổi đột phá trong các lĩnh vực như trí tuệ nhân tạo, Internet vạn vật, dữ liệu lớn, và tự động hóa. Sự phát triển của công nghệ 4.0 đang tạo ra những thay đổi sâu rộng trong tất cả các ngành công nghiệp, từ sản xuất đến dịch vụ. Bài viết này sẽ phân tích tác động của công nghệ 4.0 đối với các doanh nghiệp, cộng đồng và xã hội, cùng với những cơ hội và thách thức mà công nghệ này mang lại...', 'https://phongvu.vn/cong-nghe/wp-content/uploads/2024/09/Meme-meo-gian-doi-4.jpg', 4, '2024-12-04 10:27:05', NULL),
(5, 'Chính trị quốc tế', 'Chính trị quốc tế luôn là một chủ đề nóng và thu hút sự quan tâm của dư luận toàn cầu. Những thay đổi trong quan hệ quốc tế, các quyết định của các tổ chức quốc tế như Liên Hợp Quốc, Tổ chức Thương mại Thế giới (WTO), và các hiệp định thương mại đa phương luôn có ảnh hưởng sâu rộng đến các quốc gia. Bài viết này sẽ điểm lại những sự kiện chính trị quốc tế quan trọng và phân tích ảnh hưởng của chúng đối với các quốc gia và khu vực khác nhau...', 'https://top10tphcm.com/wp-content/uploads/2023/02/tuc-gian-1.jpg', 6, '2024-12-04 10:27:05', NULL),
(6, 'Sức khỏe và dinh dưỡng', 'Sức khỏe luôn là ưu tiên hàng đầu trong cuộc sống của mỗi người. Bài viết này sẽ đi sâu vào các yếu tố ảnh hưởng đến sức khỏe, bao gồm chế độ ăn uống, luyện tập thể thao, giấc ngủ, và các thói quen lành mạnh khác. Đặc biệt, dinh dưỡng đóng vai trò quan trọng trong việc duy trì sức khỏe và phòng ngừa các bệnh tật. Các chuyên gia dinh dưỡng sẽ chia sẻ các nguyên tắc cơ bản trong việc xây dựng chế độ ăn uống hợp lý cho mọi lứa tuổi...', 'https://www.thepoetmagazine.org/wp-content/uploads/2024/06/anh-meme-meo-tuc-gian.jpg', 8, '2024-12-04 10:27:05', NULL),
(7, 'Tin tức giáo dục', 'Giáo dục luôn đóng vai trò quan trọng trong việc phát triển nguồn nhân lực cho xã hội. Từ các trường học đến các tổ chức giáo dục đại học, từ hệ thống giáo dục quốc gia đến các nền giáo dục quốc tế, mỗi hệ thống đều có những đặc điểm và thách thức riêng. Bài viết này sẽ điểm qua những thay đổi trong lĩnh vực giáo dục, cùng với những cải cách, phương pháp giảng dạy mới và những xu hướng trong giáo dục toàn cầu...', 'https://inkythuatso.com/uploads/thumbnails/800/2022/05/a2e3ed96ecce31f2bb2d37cb712b0bed-08-23-57-27.jpg', 7, '2024-12-04 10:27:05', NULL),
(8, 'Cập nhật thời tiết hôm nay', 'Thời tiết là một yếu tố quan trọng ảnh hưởng đến các hoạt động hàng ngày của con người. Bài viết này sẽ cập nhật những thông tin mới nhất về thời tiết, bao gồm các dự báo thời tiết trong ngày và trong tuần, cùng với những cảnh báo về mưa, bão, và các hiện tượng thiên nhiên khác. Các yếu tố như nhiệt độ, độ ẩm, và hướng gió cũng sẽ được phân tích chi tiết để giúp mọi người chuẩn bị tốt cho các hoạt động ngoài trời...', 'https://top10tphcm.com/wp-content/uploads/2023/02/hinh-anh-anime-tuc-gian-cute-4.jpg', 5, '2024-12-04 10:27:05', NULL),
(9, 'Chủ đề về môi trường', 'Bảo vệ môi trường là một trong những vấn đề quan trọng nhất mà nhân loại phải đối mặt hiện nay. Chúng ta đang chứng kiến sự biến đổi khí hậu, ô nhiễm môi trường, và sự suy giảm của các hệ sinh thái tự nhiên. Bài viết này sẽ phân tích các nguyên nhân và hệ quả của ô nhiễm môi trường, cũng như các giải pháp cần thiết để giảm thiểu tác động của nó đến hành tinh và tương lai của các thế hệ sau...', 'https://inkythuatso.com/uploads/thumbnails/800/2022/05/43615028-1113782398795563-2335904224052772864-n-08-23-58-51.jpg', 9, '2024-12-04 10:27:05', NULL),
(10, 'Tin tức du lịch', 'Du lịch là một phần không thể thiếu trong cuộc sống hiện đại. Chúng ta không chỉ du lịch để thư giãn mà còn để khám phá các nền văn hóa, tìm hiểu các địa danh lịch sử và tận hưởng thiên nhiên. Bài viết này sẽ giới thiệu các điểm đến du lịch hấp dẫn, từ các thành phố nổi tiếng đến các vùng đất hoang sơ ít người biết đến. Cùng với đó là những mẹo nhỏ giúp bạn có một chuyến du lịch hoàn hảo...', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNH0yskufSLd40vZcRY1d72W48C0aS_wG1zg&s', 10, '2024-12-04 10:27:05', NULL),
(11, 'Văn hóa đặc sắc', 'Văn hóa là linh hồn của mỗi dân tộc, thể hiện trong các truyền thống, lễ hội, nghệ thuật và lối sống. Bài viết này sẽ khám phá những đặc sắc văn hóa của các quốc gia, từ các lễ hội truyền thống đến các nghệ thuật dân gian. Chúng ta sẽ tìm hiểu về các giá trị văn hóa truyền thống và sự thay đổi của chúng trong bối cảnh hiện đại, cùng với các biện pháp bảo tồn và phát huy các giá trị văn hóa quý báu...', 'https://m.yodycdn.com/blog/meme-meo-bua-yody-vn-54.jpg', 11, '2024-12-04 10:27:05', NULL),
(12, 'Khoa học và khám phá', 'Khoa học luôn mang lại cho chúng ta những khám phá mới về thế giới xung quanh. Từ vật lý, hóa học đến sinh học, vũ trụ học, và các lĩnh vực khác, khoa học luôn là nguồn cảm hứng vô tận cho những ai yêu thích nghiên cứu và khám phá. Bài viết này sẽ giới thiệu những phát hiện khoa học mới nhất, các nghiên cứu đột phá, cùng với những ý tưởng khoa học thú vị giúp chúng ta hiểu rõ hơn về thế giới...', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJVxAZovpoYplFgnTaNA3Vbo7-ARXAIUqmfQ&s', 12, '2024-12-04 10:27:05', NULL),
(13, 'Âm nhạc Việt Nam', 'Âm nhạc là một phần không thể thiếu trong đời sống tinh thần của mỗi người. Từ các ca khúc truyền thống đến các bài hát hiện đại, âm nhạc Việt Nam luôn đa dạng và phong phú. Bài viết này sẽ điểm lại các ca sĩ, nhóm nhạc nổi bật, các sự kiện âm nhạc lớn, cùng với những xu hướng âm nhạc mới đang chiếm lĩnh thị trường...', 'https://megaweb.vn/blog/uploads/images/meme-meo-cute-5.jpg', 2, '2024-12-04 10:27:05', NULL),
(14, 'Kỹ năng sống cần thiết', 'Kỹ năng sống là yếu tố quan trọng giúp chúng ta vượt qua những thử thách trong cuộc sống hàng ngày. Từ các kỹ năng giao tiếp, lãnh đạo đến kỹ năng giải quyết vấn đề và quản lý thời gian, bài viết này sẽ chia sẻ những kỹ năng sống cần thiết để thành công trong công việc và cuộc sống. Các mẹo vặt hữu ích sẽ giúp bạn phát triển bản thân và đạt được mục tiêu trong mọi lĩnh vực...', 'https://inkythuatso.com/uploads/thumbnails/800/2022/05/anh-meo-che-anh-meo-bua-17-09-00-01-36.jpg', 13, '2024-12-04 10:27:05', NULL),
(15, 'Lịch sử Việt Nam', 'Lịch sử Việt Nam là một kho tàng phong phú và kỳ vĩ, phản ánh những cuộc chiến tranh, những chiến thắng oai hùng, cùng với những câu chuyện về sự khởi đầu và phát triển của dân tộc. Bài viết này sẽ đưa bạn trở về quá khứ để khám phá những giai đoạn quan trọng trong lịch sử Việt Nam, từ thời kỳ dựng nước đến các thời kỳ phong kiến, cùng với những nhân vật lịch sử vĩ đại...', 'https://i.pinimg.com/736x/fd/10/49/fd10499f85ef69931f192c02068efb8f.jpg', 14, '2024-12-04 10:27:05', NULL),
(16, 'Giới thiệu về các loại sách', 'Sách là nguồn tri thức vô giá, mở rộng tầm hiểu biết và giúp chúng ta phát triển bản thân. Bài viết này sẽ giới thiệu về các thể loại sách, từ văn học, lịch sử đến khoa học, kinh tế và kỹ năng sống. Các bạn sẽ tìm thấy những gợi ý về những cuốn sách hay, cũng như lý do tại sao đọc sách lại là một thói quen tốt cho mọi lứa tuổi...', 'https://inkythuatso.com/uploads/thumbnails/800/2022/05/66871558-2326455354284058-6639622133666283520-n-09-00-02-08.jpg', 15, '2024-12-04 10:27:05', NULL),
(17, 'Những xu hướng trong thiết kế', 'Thiết kế luôn thay đổi theo thời gian, với những xu hướng mới được cập nhật liên tục. Bài viết này sẽ phân tích những xu hướng thiết kế đang thịnh hành trong các lĩnh vực như thời trang, kiến trúc, đồ họa, và sản phẩm. Chúng ta sẽ tìm hiểu về những phong cách thiết kế nổi bật, cùng với các công nghệ mới đang thay đổi cách thức sáng tạo...', 'https://cdn11.dienmaycholon.vn/filewebdmclnew/public/userupload/files/Image%20FP_2024/meme-meo-41.jpg', 16, '2024-12-04 10:27:05', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('yWBXE1kFLgynP2YZUg3HmqKMUVGD4i6XZ5wrZYj2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMHlrcHdwa0p5Rm1CNHUwa1Jka05JMVc3dTlqajZkTFF0bGZuV20ySyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RlciI7fX0=', 1733542288);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'admin', 'admin@admin.com', NULL, '$2y$12$IidCho8ypWjdxVFbbPEQwOCe0p7sqVXEDb9vdNzLn1nG4m.HMv6te', 'user', NULL, '2024-12-03 23:18:47', '2024-12-03 23:18:47'),
(7, 'admin1', 'admin@admin1.com', NULL, '$2y$12$.ZfWK3kghO2ESao.AN3eU.j7aWbxGuKyJFUP7M83KmMaaUOJWeicq', 'user', NULL, '2024-12-03 23:51:12', '2024-12-03 23:51:12'),
(8, 'nhat', 'nhat@nhat.com', NULL, '$2y$12$TSW4WD/fuAeEmUj2cYgJ5e896sb/idPaIFFE1hln5JxA7puWYExoK', 'user', NULL, '2024-12-04 00:01:42', '2024-12-04 00:01:42'),
(9, 'admin11', 'admin@admin11.com', NULL, '$2y$12$lyDOpj3DEmcripFBbCLF.OJSA48k0xtyk/6qiNnpYmafxJ8jsb0iS', 'user', NULL, '2024-12-04 00:05:47', '2024-12-04 00:05:47'),
(10, 'nhat1111', 'admin@admi1111.com', NULL, '$2y$12$7yUli57ZoWvI.kO.7Ch8IuGJI2ENZdG5z0dQEMMSP6DsS8.714aNe', 'user', NULL, '2024-12-04 00:06:05', '2024-12-04 00:06:05'),
(11, 'admin111111', 'admin@ad1111min.com', NULL, '$2y$12$Zk7hQK/bw7dDuRldrR6YQunFe5RqDFwb2G82Hzd2a5cYdr61tagk6', 'admin', NULL, '2024-12-04 00:09:09', '2024-12-04 00:09:09'),
(12, 'Quan', 'quanquan@gmail.com', NULL, '$2y$12$IidCho8ypWjdxVFbbPEQwOCe0p7sqVXEDb9vdNzLn1nG4m.HMv6te', 'user', NULL, '2024-12-05 01:20:31', '2024-12-05 01:20:31'),
(13, 'admin12', 'admin@admin123.com', NULL, '$2y$12$HA9F.B2BMskqyhOF9HbhNeRCe3PlSJ/xrQhz14RIVdzOQgwbfcfLq', 'admin', NULL, '2024-12-06 00:58:30', '2024-12-06 00:58:30'),
(14, 'admin', 'admin1234@admin.com', NULL, '$2y$12$rYDZQptWJmWjobpco3r1yevv.BMnj5PA7/qYf6hlED8u1jJlxFOk.', 'admin', NULL, '2024-12-06 19:38:40', '2024-12-06 19:38:40'),
(15, 'admin111', 'admin@admin111.com', NULL, '12345678', 'admin', NULL, NULL, NULL),
(16, 'admin0', 'admin@admin0.com', NULL, '$2y$10$tk1daxSC6N1lUFMBeUNxVu20/sDqRemSsrIBVMIr3Kua2sfZRCAzq', 'admin', NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
