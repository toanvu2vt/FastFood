<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Fast Food</title>
<link rel="shortcut icon" href="images/favicon.svg" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
	integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
	integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<!-- header -->
	<header>
		<a href="/home/index" class="logo"> <img src="/images/logo.svg"
			alt="logo">
		</a> </a>
		<ul class="navigation">
			<c:choose>
				<c:when test="${not empty sessionScope.user}">
					<span id="close-nav"><i class="fas fa-times"></i></span>
					<li class="nav-item"><a class="nav-link nav-link-1"
						data-toggle="modal" data-target="#changePassModal"
						aria-current="page" href="">Welcome,${sessionScope.user.username}</a>
					</li>
					<li><a href="/home/index">Trang chủ</a></li>
					<li><a href="/home/shop">Cửa hàng</a></li>
					<c:if test="${sessionScope.user.admin == true}">
						<li class="nav-item"><a class="nav-link nav-link-1"
							href="/admin">Statistical</a></li>
					</c:if>
					<li class="nav-item"><a class="nav-link nav-link-1"
						href="/logout">Log out</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/home/index">Trang chủ</a></li>
					<li><a href="/home/shop">Cửa hàng</a></li>
					<li><a href="/home/register">Đăng ký</a></li>
					<li><a href="/home/login">Đăng nhập</a></li>
				</c:otherwise>
			</c:choose>



		</ul>

		<div class="icon">
			<a href="/home/cart">
				<div class="cart">
					<svg xmlns="http://www.w3.org/2000/svg" width="142.25"
						height="189.333" viewBox="0 0 142.25 189.333">
                        <g id="shopping-bag-svgrepo-com"
							transform="translate(-55.3 -1.5)">
                            <path id="Path_9" data-name="Path 9"
							d="M190.014,162.8l-10.1-121.435a5,5,0,0,0-4.836-4.737H154.286C154,16.368,138.48,0,119.425,0S84.852,16.368,84.564,36.627H63.777a4.974,4.974,0,0,0-4.836,4.737L48.836,162.8c0,.154-.036.308-.036.462,0,13.827,11.873,25.073,26.489,25.073h88.272c14.616,0,26.489-11.246,26.489-25.073A2,2,0,0,0,190.014,162.8ZM119.425,10.4c13.678,0,24.829,11.708,25.118,26.228H94.308C94.6,22.107,105.747,10.4,119.425,10.4Zm44.136,167.536H75.289c-9.166,0-16.6-6.47-16.745-14.443L68.216,47.064H84.528V62.855a4.882,4.882,0,1,0,9.744,0V47.064h50.271V62.855a4.882,4.882,0,1,0,9.744,0V47.064H170.6l9.708,116.428C180.162,171.464,172.692,177.935,163.561,177.935Z"
							transform="translate(7 2)" fill="#fff" stroke="#fff"
							stroke-width="3" />
                        </g>
                    </svg>
					<c:if test="${ countCart >0}">
						<span>${ countCart }</span>
					</c:if>
				</div>
			</a> <span id="navbar-toggler"> <i class="fas fa-stream"></i>
			</span>
		</div>

	</header>
	<!--end header -->
	<!-- body -->
	<div class="banner">
		<div class="content">
			<h1>
				Giao hàng tận nơi <span>với</span>
			</h1>
			<h1>Mức giá siêu ưu đãi !</h1>
			<h4>Tìm kiếm các loại đồ ăn, thức uống nhanh chống, dễ dàng.</h4>
			<form action="">
				<div class="search-box">
					<input type="search" name="" id=""
						placeholder="Tìm loại  đồ ăn, thức uống...">
					<button class="btn btn-secondary ">Tìm kiếm</button>
				</div>
			</form>
			<a href="/home/shop" class="btn btn-primary">Xem cửa hàng<i
				class="fas fa-arrow-right"></i></a>
		</div>
	</div>

	<!-- ====   Menu List   ==== -->
	<section class="menu-list">
		<div class="title-box">
			<h1 class="title-line">
				<span>Danh sách món</span>
			</h1>
		</div>
		<div class="list-products" id='listProd'>
			<c:forEach var="item" items="${page.content}" varStatus="loop">
				<div class="card-product">
					<a href="/home/detail"> <img src="/images/${item.image}" alt=""></a>
					<h4>${item.name}</h4>
					<div>
						<p class="price">
							Giá:
							<fmt:formatNumber type="number" value="${ item.price }" />
							VND
						</p>

						<span><i class="fas fa-star"></i> 4.5</span>
					</div>
					<a class="btn btn-secondary" href="/cart/add/${item.id}">
						<i class="fas fa-shopping-bag"></i>Thêm vào giỏ hàng
					</a>
				</div>
			</c:forEach>
		</div>
		<div class="see-more">
			<a href="/home/shop">
				<button class="btn btn-primary">
					Xem cửa hàng<i class="fas fa-arrow-right"></i>
				</button>
			</a>
		</div>
	</section>
	<!-- ------------------------xx------------------- -->
	<!-- ====   Category description    ==== -->

	<section class="category-introduce food-introduce">
		<div class="box">
			<div class="box-content">
				<h2>Thức ăn</h2>
				<p>
					&emsp; &emsp;Ẩm thực Âu - Mỹ lâu nay vẫn từng hấp dẫn nhiều tín đồ
					yêu thích ẩm thực bởi sự đa dạng trong nguyên liệu, đậm đà với vị
					sốt nhiều khẩu vị, cũng như màu sắc bắt mắt. Đặc biệt là với các
					thể loại món thức ăn nhanh như Pizza, Burger… được phủ ngập nhiều
					loại topping thịt bò, heo, gà, hải sản… khác nhau sẵn sàng cho một
					bữa tiệc siêu chill tại gia. Lớp đế được làm nóng hổi, giòn thơm
					mùi vỏ bánh, được xếp đặt ngập ngụa topping tương xứng với lớp sốt
					đi kèm, còn gì thích hơn cắn một miếng sẽ cảm nhận được từng tầng
					mùi thơm quyến luyến quyện với khẩu vị độc đáo phù hợp tay nghề của
					người làm bếp.<br> <br> &emsp; &emsp;Lên kèo hẹn cạ cứng
					tại nhà, bật ngay ứng dụng FastFoodđể sẵn sàng đại tiệc thật ngon.
					Với danh sách các cửa hàng món Âu Mỹ thiệt xịn, ứng dụng sẽ giúp
					bạn tìm ra các cửa hàng cho phép đặt pizza online, order pizza tận
					nhà, đặt đồ ăn nhanh nhanh chóng mà không phải đi tìm từng địa chỉ
					trên thanh tìm kiếm.
				</p>
				<a href="/home/shop">
					<button class="btn btn-primary">Vào cửa hàng</button>
				</a>
			</div>
			<div class="box-img">
				<img src="/images/food-introduce.jpg" alt="">
			</div>
		</div>
	</section>
	<section class="category-introduce drink-introduce">
		<div class="box">

			<div class="box-img">
				<img src="/images/drink-introduce.jpg" alt="">
			</div>
			<div class="box-content">
				<h2>Đồ uống và Tráng miệng</h2>
				<p>
					&emsp;&emsp;Không còn gì tuyệt bằng việc tự thưởng cho bản thân tận
					hưởng hương vị ngon lành: trà sữa, sinh tố hay cafe… để nạp lại
					năng lượng sau khi kết thúc một ngày làm việc vất vả. Tuy nhiên,
					đôi khi vì lịch trình làm việc bận rộn, người dùng đã quen với việc
					sử dụng các ứng dụng giao đặt nước online để tiết kiệm thời gian mà
					vẫn khám phá được một món ngon lành thông qua. Trong đó, ứng dụng
					FastFood ngoài việc có các bộ lọc khác nhau còn đi kèm nhiều ưu
					đãi.<br> <br> &emsp; &emsp; Ở nhà thưởng thức cả thế giới
					tráng miệng đa dạng chưa bao giờ dễ hơn ở thời điểm hiện tại với
					các tín đồ yêu thích ẩm thực. Thậm chí ở hiện tại, tráng miệng
					không chỉ được dùng sau bữa ăn chính như thói quen ngày xưa của
					nhiều gia đình, hay là đặt xôi chè trong các dịp lễ giỗ ở nhà, mà
					còn là các món bánh hay các món salad, kem,… sẵn sàng mời gọi mọi
					lúc. Thèm gì có đó, chỉ cần ở ngay tại nhà thông qua Internet, việc
					đặt món tráng miệng, các món dessert hay các món đồ ăn nhà làm, từ
					bình dân đến cao cấp đều dễ dàng tìm thấy được.
				</p>
				<a href="/home/shop">
					<button class="btn btn-primary">Vào cửa hàng</button>
				</a>
			</div>
		</div>
	</section>

	<!-- ---------------xx---------------- -->
	<!-- ====   Banner lazy     ==== -->
	<section class="banner-lazy">
		<div class="box">
			<div class="box-img">
				<img src="/images/banner-3.jpg" alt="">
			</div>
			<div class="box-content">
				<h2>Pizza tươi ngon, đậm đà hương vị</h2>
				<p>Phục vụ những chiếc bánh pizza lò củi đúng chuẩn Napoli ngon
					tuyệt và những món ăn phong vị Ý được lấy cảm hứng từ truyền thống
					hơn 200 năm.</p>
				<img src="/images/pizza-logo.png   " alt="">
			</div>
		</div>
	</section>

	<!-- --------------xx---------------- -->
	<!-- ====   Service    ==== -->
	<section class="service">
		<div class="box">
			<div class="card">
				<div class="card-img">
					<img src="/images/how_1.png" alt="">
				</div>
				<div class="card-content">
					<h3>Đặt hàng đơn giản</h3>
					<p>Truy cập vào website, chọn món ăn bạn muốn sau đó bấm thanh
						toán, chúng tôi sẽ giao đến tận nơi cho bạn.</p>
				</div>
			</div>
			<div class="card">
				<div class="card-img">
					<img src="/images/how_2.png" alt="">
				</div>
				<div class="card-content">
					<h3>Đặt hàng đơn giản</h3>
					<p>Truy cập vào website, chọn món ăn bạn muốn sau đó bấm thanh
						toán, chúng tôi sẽ giao đến tận nơi cho bạn.</p>
				</div>
			</div>
		</div>
		<div class="box">
			<div class="card">
				<div class="card-img">
					<img src="/images/how_3.png" alt="">
				</div>
				<div class="card-content">
					<h3>Đặt hàng đơn giản</h3>
					<p>Truy cập vào website, chọn món ăn bạn muốn sau đó bấm thanh
						toán, chúng tôi sẽ giao đến tận nơi cho bạn.</p>
				</div>
			</div>
		</div>

		<div class="service-description">
			<div class="box">
				<h2>Đặt hàng ngay</h2>
				<p>Trải nghiệm ẩm thực với đa dạng các món ăn đặc trưng vùng
					miền đầy sáng tạo luôn là trải nghiệm thú vị với tất cả thực khách
					ở các thành phố lớn. Tuy nhiên, vì nhịp sống bận rộn, nhiều người
					đã lựa chọn các app đặt đồ ăn online để giúp cho việc tận hưởng bữa
					ăn ngon thêm dễ dàng hơn rất nhiều. Đi kèm với các ưu đãi như miễn
					phí ship, khuyến mãi cho người dùng mới… FastFood với nhiều lựa
					chọn cửa hàng ở 16 tỉnh thành đang trở thành ứng dụng tiện ích giao
					đồ ăn nhanh chóng.</p>
				<a href="/home/shop">
					<button class="btn btn-primary">Xem thêm</button>
				</a>
			</div>
		</div>
	</section>
	<!-- ---------xx--------------- -->
	<!--end body -->


	<!-- ====   Footer  ==== -->
	<footer class="footer">
		<div class="box">
			<div class="openning-hour">
				<h2>Giờ mở cửa</h2>
				<ul>
					<li><span>Thứ hai - Thứ sáu</span> <span>08:30 - 23:00h</span>
					</li>
					<li><span>Thứ bảy</span> <span>07:00 - 23:00h</span></li>
					<li><span>Chủ nhật</span> <span>07:00 - 23:00h<h /span></li>
				</ul>
			</div>
			<div class="address">
				<h2>Địa chỉ</h2>
				<ul>
					<li><i class="fas fa-map-marker-alt"></i>
						<p>Fast Food HCM</p></li>
					<li><i class="fas fa-phone-alt"></i>
						<p>0123 456 789</p></li>
					<li><i class="fas fa-envelope"></i>
						<p>fastfoodhcm@gmail.com</p></li>
				</ul>
			</div>
		</div>

		<div class="map">
			<iframe src="" width="100%" height="350" style="border: 0;"
				allowfullscreen="" loading="lazy"></iframe>
		</div>

		<div class="box">
			<div class="subscribe">
				<h2>Đăng ký ngay</h2>
				<p>Đăng ký ngay để nhận các bản cập nhật mới của chúng tôi và
					nhận các ưu đãi và nội dung thường xuyên.</p>
				<div class="textfield">
					<input type="email" placeholder="Địa chỉ mail của bạn">
					<button class="btn btn-primary">Đăng ký</button>
				</div>
			</div>

			<div class="social">
				<h2>Kết nối với chúng tôi</h2>
				<div class="list-item">
					<a href="#">
						<div class="item">
							<i class="fab fa-facebook-f"></i>
						</div>
					</a> <a href="#">
						<div class="item">
							<i class="fab fa-instagram"></i>
						</div>
					</a> <a href="#">
						<div class="item">
							<i class="fab fa-twitter"></i>
						</div>
					</a> <a href="#">
						<div class="item">
							<i class="fab fa-google-plus-g"></i>
						</div>
					</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- -----------xx--------------- -->

	<div class="coppyright">
		<p>
			copyright © 2023 <span>Fast Food.</span> All rights reserved.
		</p>
	</div>
	<!--end footer -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
		integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="/js/main.js"></script>
</body>
</html>
