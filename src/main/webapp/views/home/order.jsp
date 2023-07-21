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
	<!-- ====   Navigation  ==== -->
	<header class="fixed">
		<a href="/home/index" class="logo"> <img src="/images/logo.svg" alt="logo">
		</a>
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
					<span>1</span>
				</div>
			</a> <span id="navbar-toggler"> <i class="fas fa-stream"></i>
			</span>
		</div>
	</header>

	<!-- ---------------xx-------------- -->
	<section class="page-heading">
		<div class="content">
			<h2>Đặt hàng</h2>
			<span> <i class="fas fa-home"></i> <a href="/home/index">Trang
					chủ</a> <i class="fas fa-angle-right"></i> <a href="/home/cart">Giỏ
					hàng</a> <i class="fas fa-angle-right"></i> <a href="/home/order">Đặt
					hàng</a>
			</span>
		</div>
	</section>
	<!-- ====   Order    ==== -->
	<section class="order-page">
		<div class="order-page-content">
			<div class="customer-info">
				<div class="heading">
					<h3>Thông tin đặt hàng</h3>
				</div>
				<div class="content">
					<form action="">
						<div class="form-group">
							<label for="">Tên người đặt hàng</label> <input type="text"
								name="" id="" value="">
						</div>
						<div class="form-group">
							<label for="">Điện thoại</label> <input type="text" name="" id=""
								value="">
						</div>
						<div class="form-group">
							<label for="">Địa chỉ</label> <input type="text" name="" id=""
								value="">
						</div>
						<div class="form-group">
							<label for="">Ghi chú</label>
							<textarea name="" id="" cols="30" rows="5">Nội dung...</textarea>
						</div>
					</form>
				</div>
			</div>

			<div class="order-detail">
				<div class="heading">
					<h3>Chi tiết đặt hàng</h3>
					<p>Hoá đơn thanh toán</p>
				</div>
				<div class="content">
					<i class="far fa-list-alt"></i>
					
					<div class="list-items">
					<c:forEach var="item" items="${cart.items}">
						<div class="item">
							<span>${item.qty} x ${item.name}</span> 
							<span><fmt:formatNumber type="number"
									value="${ item.price*item.qty }" />
								VND</span>
						</div>
						</c:forEach>
					</div>
					<p>Thanh toán khi nhận hàng</p>
					<div class="total">
						<span>Tổng cộng:</span> <strong><fmt:formatNumber type = "number" value = "${amount}"/> VNĐ</strong>
					</div>
					<button class="btn btn-primary">Đặt hàng</button>
					
				</div>

			</div>
		</div>
	</section>

	<!-- --------xx--------- -->s

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
						<p>273 An D. Vương, Phường 3, Quận 5,Thành phố Hồ Chí Minh,
							Việt Nam</p></li>
					<li><i class="fas fa-phone-alt"></i>
						<p>0123 456 789</p></li>
					<li><i class="fas fa-envelope"></i>
						<p>infor@domain.com</p></li>
				</ul>
			</div>
		</div>

		<div class="map">
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.669658423672!2d106.68006961411632!3d10.75992236244198!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f1b7c3ed289%3A0xa06651894598e488!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBTw6BpIEfDsm4!5e0!3m2!1svi!2s!4v1637559140172!5m2!1svi!2s"
				width="100%" height="350" style="border: 0;" allowfullscreen=""
				loading="lazy"></iframe>
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
			copyright © 2021 <span>Fast Food.</span> All rights reserved.
		</p>
	</div>

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
