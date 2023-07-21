<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Order</title>
<script src="https://kit.fontawesome.com/f6131b4c65.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/admin_index.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style type="text/css">
.form__input {
	font-family: 'Roboto', sans-serif;
	color: #333;
	font-size: 1.2rem;
	margin: 0 auto;
	padding: 1.5rem 2rem;
	border-radius: 0.2rem;
	background-color: rgb(255, 255, 255);
	border: none;
	width: 90%;
	display: block;
	border-bottom: 0.3rem solid transparent;
	transition: all 0.3s;
	margin-top: 10px;
}

.buttons-container {
	display: flex;
	align-items: center;
	justify-content: center;
}

.button-arounder {
	background: white;
	border: solid 2px black;
	padding: .375em 1.125em;
	font-size: 1rem;
}

.button-arounder {
	background: hsl(190deg, 30%, 15%);
	color: hsl(190deg, 10%, 95%);
	box-shadow: 0 0px 0px hsla(190deg, 15%, 5%, .2);
	transfrom: translateY(0);
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px; -
	-dur: .15s; -
	-delay: .15s; -
	-radius: 16px;
	transition: border-top-left-radius var(- -dur) var(- -delay) ease-out,
		border-top-right-radius var(- -dur) calc(var(- -delay)* 2) ease-out,
		border-bottom-right-radius var(- -dur) calc(var(- -delay)* 3) ease-out,
		border-bottom-left-radius var(- -dur) calc(var(- -delay)* 4) ease-out,
		box-shadow calc(var(- -dur)* 4) ease-out, transform calc(var(- -dur)*
		 4) ease-out, background calc(var(- -dur)* 4) steps(4, jump-end);
}

.button-arounder:hover, .button-arounder:focus {
	box-shadow: 0 4px 8px hsla(190deg, 15%, 5%, .2);
	transform: translateY(-4px);
	background: hsl(230deg, 50%, 45%);
	border-top-left-radius: var(- -radius);
	border-top-right-radius: var(- -radius);
	border-bottom-left-radius: var(- -radius);
	border-bottom-right-radius: var(- -radius);
}
</style>
</head>

<body>
	<div class="container">
		<aside>
			<div class="top">
				<div class="logo">
					<a href="/home/index"><img src="/images/logo.svg" alt=""></a>
				</div>
				<div class="close" id="close-btn">
					<span class="material-symbols-outlined">close</span>
				</div>
			</div>
			<div class="sidebar">
				<a href="/admin" id="dashboard" role="button"> <span
					class="material-symbols-outlined">grid_view</span>
					<h3>Dashboard</h3>
				</a>
				<a href="/admin/account" id="customers" role="button"> <span
					class="material-symbols-outlined">person</span>
					<h3>Account</h3>
				</a> 
				<a href="/admin/product" id="products" role="button"> <span
					class="material-symbols-outlined">inventory</span>
					<h3>Products</h3>
				</a> 
				<a href="/admin/order" id="order" role="button"> <span
					class="material-symbols-outlined">inventory</span>
					<h3>Order</h3>
				</a> 
				<a href="/admin/orderdetail" id="order" role="button"> <span
					class="material-symbols-outlined">inventory</span>
					<h3>OrderDetail</h3>
				</a> 
				<a href="/logout"> 
				<span class="material-symbols-outlined">logout</span>
					<h3>Logout</h3>
				</a>
			</div>
		</aside>

		<main>
			<%-- <div id="accountList" class="recent-orders" style="display: block; margin-bottom: 30px">
					<div id="accountMana" style="display: block; margin-bottom: 10%">
						<h2>Account Management</h2>
						<form:form action="/admin/account" method="post" modelAttribute="us">
							<c:if test="${not empty error_account}">
								<div class="form__group">
								  <input style="background-color: #ffe4e4; border: 1px solid red; color: #b65a5a;" 
								  type="text" class="form__input" name="error" readonly="readonly" value="${error_account}"/>
								</div>
							</c:if>
							<c:if test="${not empty success_account}">
								<div class="form__group">
								  <input style="background-color: #e9ffe4; border: 1px solid #00ff1a; color: #63b65a;" 
								  type="text" class="form__input" name="success" readonly="readonly" value="${success_account}"/>
								</div>
							</c:if>
							<div class="form__group">
							  <form:input path="id" type="hidden" class="form__input" name="id" />
							</div>
							<div class="form__group">
							  <form:input path="username" type="text" class="form__input" name="username" placeholder="Username" />
							</div>
							<div class="form__group">
							  <form:input path="password" type="password" class="form__input" name="password" placeholder="Password" />
							</div>
							<div class="form__group">
							  <form:input path="fullname" type="text" class="form__input" name="fullname" placeholder="Full name" />
							</div>
							<div class="form__group">
							  <form:input path="email" type="text" class="form__input" name="email" placeholder="Email"/>
							</div>
							<div class="form__group">
							  <select class="form__input" name="admin" id="admin">
								  <c:if test="${us.admin == true || empty us}">
								    <option value="true">Admin</option>
								    <option value="false">User</option>
								  </c:if>
								  <c:if test="${us.admin == false}">
								    <option value="true">Admin</option>
								    <option selected value="false">User</option>
								  </c:if>
							  </select>
							</div>
							<div class="buttons-container" style="float: right; margin-right: 5%; margin-top: 20px;">
								<button type="submit" class="button-arounder" formaction="/admin/account/create">Create</button>
								<button type="submit" class="button-arounder">Update</button>
								<button type="submit" class="button-arounder">Delete</button>
								<button type="submit" class="button-arounder">New</button> 
							</div>
						</form:form>
					</div>
					<h2>Accounts List</h2>
					<table>
						<thead>
							<tr>
								<th>User ID</th>
								<th>Name</th>
								<th>Email</th>
								<th>Role</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="a" items="${accounts}">
								<tr>
									<td>${a.id}</td>
									<td>${a.fullname}</td>
									<td>${a.email}</td>
									<c:if test="${a.admin == true}">
										<td class="warning">Admin</td>
									</c:if>
									<c:if test="${a.admin == false}">
										<td class="warning">User</td>
									</c:if>
									<td class="primary"><a href=""><span class="material-symbols-outlined">edit</span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${empty showAllAccount}">
						<a href="">Show All</a>
					</c:if>
					<c:if test="${not empty showAllAccount}">
						<a href="">Shorten</a>
					</c:if>
				</div> --%>
			<div id="orderList" class="recent-orders"
				style="display: block; margin-bottom: 30px">
				<h2>Order List</h2>
				<table>
					<thead>
						<tr>
							<th>Order ID</th>
							<th>User ID</th>
							<th>Address</th>
							<th>Create Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listOrder}" var="o">
							<tr>
								<td>${o.id}</td>
								<td>${o.account.id}</td>
								<td>${o.address}</td>
								<td>${o.createDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${empty showAllProduct}">
					<a href="">Show All</a>
				</c:if>
				<c:if test="${not empty showAllProduct}">
					<a href="">Shorten</a>
				</c:if>
			</div>
		</main>

		<div class="right">
			<div class="top">
				<button id="menu-btn">
					<span class="material-symbols-outlined">menu</span>
				</button>
				<div class="theme-toggler">
					<span class="material-symbols-outlined active">light_mode</span> <span
						class="material-symbols-outlined">dark_mode</span>
				</div>
				<div class="profile">
					<div class="info">
						<p>
							Hey, <b>${user.fullname}</b>
						</p>
						<small class="text_muted">Admin</small>
					</div>
					<div class="profile-photo">
						<span class="material-symbols-outlined">person</span>
					</div>
				</div>
			</div>


		</div>
	</div>


	<script type="text/javascript">
	 		document.getElementById("itemID").style.display = "none";
	
			/* const sideMenu = document.querySelector("aside");
			const menuBtn = document.querySelector("#menu-btn");
			const closeBtn = document.querySelector("#close-btn");
			const themeToggler = document.querySelector(".theme-toggler");
	
			const dashboard = document.querySelector("#dashboard");
			const customers = document.querySelector("#customers");
			const products = document.querySelector("#products");
			
			const productList = document.querySelector("#productList");
			const accountList = document.querySelector("#accountList");
			const accountMana = document.querySelector("#accountMana");
			const productMana = document.querySelector("#productMana");
	
			menuBtn.addEventListener('click', () => {
			    sideMenu.style.display = 'block';
			})
	
			closeBtn.addEventListener('click', () => {
			    sideMenu.style.display = 'none';
			})
	
			window.addEventListener('resize', () => {
			    if(window.innerWidth >= 769){
			        sideMenu.style.display = 'block';
			    }
			    else {
					sideMenu.style.display = 'none';
				}
			}) */
			const themeToggler = document.querySelector(".theme-toggler");
			themeToggler.addEventListener('click', () => {
			    document.body.classList.toggle('dark-theme-variables');
			    themeToggler.querySelector('span:nth-child(1)').classList.toggle('active');
			    themeToggler.querySelector('span:nth-child(2)').classList.toggle('active');
			})
	
			/* const selectButton = (x) => {
			    if(dashboard.classList.contains("active")){
			        dashboard.classList.toggle('active')
			    }
			    else if(customers.classList.contains("active")){
			        customers.classList.toggle('active')
			    }
			    else if(products.classList.contains("active")){
			        products.classList.toggle('active')
			    }
			    if(x == "dashboard"){
			    	productList.style.display = "none";
			    	accountList.style.display = "none";
			    	accountMana.style.display = "none";
			    	productMana.style.display = "none";
			    }
			    if(x == "customers"){
			    	accountList.style.display = "block";
			    	productList.style.display = "none";
			    	accountMana.style.display = "block";
			    	productMana.style.display = "none";
			    }
			    if(x == "products") {
			    	productList.style.display = "block";
			    	accountList.style.display = "none";
			    	accountMana.style.display = "none";
			    	productMana.style.display = "block";
			    }
			    var a = '#' +x;
			    document.querySelector(a).classList.toggle("active");
			} */
		</script>
	<%-- <c:if test="${not empty showAllProduct or not empty showProduct}">
			<script type="text/javascript">
				const dash = document.querySelector("#dashboard");
				const pro = document.querySelector("#products");
				dash.classList.toggle('active')
				pro.classList.toggle('active')
				document.querySelector("#productList").style.display = "block";
				document.querySelector("#productMana").style.display = "block";
			</script>
		</c:if>
		<c:if test="${not empty showAllAccount or not empty showAccount}">
			<script type="text/javascript">
				const dash = document.querySelector("#dashboard");
				const cus = document.querySelector("#customers");
				dash.classList.toggle('active')
				cus.classList.toggle('active')
				document.querySelector("#accountList").style.display = "block";
				document.querySelector("#accountMana").style.display = "block";
			</script>
		</c:if>  --%>
</body>
</html>