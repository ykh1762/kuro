<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="email-app">
	<div class="left-part" style="width: 200px; background-color: #D2E0F5;">
		<a
			class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none"
			href="javascript:void(0)"></a>
		<div class="scrollable" style="height: 100%">
			<div class="p-3">
				<a id="compose_mail"
					class="waves-effect waves-light btn btn-danger d-block" style="background-color: #2962FF;"
					href="javascript:void(0)" onclick="openPopup()">쪽지 보내기</a>
			</div>
			<div class="divider"></div>
			<ul class="list-group">

				<li class="list-group-item"><a
					href="/message/home?empNo=${SessionInfo.empNo }"
					class="list-group-item-action d-flex align-items-center"><i
						data-feather="inbox" class="feather-sm fill-white me-2"></i> 받은쪽지
						</a>
				</li>

				<li class="list-group-item"><a
					href="/message/list2?empNo=${SessionInfo.empNo }"
					class="list-group-item-action d-flex align-items-center"> <i
						data-feather="send" class="feather-sm fill-white me-2"></i> 보낸쪽지 
				</a></li>
				<li class="list-group-item"><a href="/message/store"
					class="list-group-item-action"> <i data-feather="star"
						class="feather-sm fill-white me-2"></i> 보관쪽지
				</a></li>
				

			</ul>
		</div>
	</div>
	<!-- -------------------------------------------------------------- -->
	<!-- Right Part -->
	<!-- -------------------------------------------------------------- -->
	<div class="right-part mail-list bg-white overflow-auto" style="width: calc(100% - 200px); margin-left: 200px;">
		<div class="p-3 b-b" style="display: inline-block; text-align: right;">
			<div class="d-flex align-items-center">
				<div class="head" style="float: left;">
					<div class="btn-group mb-2" style="padding-top: 3px;"></div>
				</div>
				<div class="ms-auto">
					<h4>보관 쪽지함</h4>
				</div>
			</div>
		</div>
		<!-- Action part -->
		<!-- Button group part -->
		<div class="bg-light p-3 d-md-flex align-items-center">
			<div class="btn-group mt-1 mb-1">
				<input placeholder="Search Message" id="input" type="text"
					class="form-control" />
			</div>
			<div class="ms-auto">
				<div class="btn-group me-2" role="group"
					aria-label="Button group with nested dropdown"></div>
			</div>
		</div>
		<!-- Action part -->
		<!-- Mail list-->
		<div class="table-responsive">
			<table class="table table-striped table-bordered display text-nowrap"
				id="custom_tool_ele" style="border: 2px solid #9ea7ad82;">
				<thead>
					<tr>

						<th style="text-align: center;" scope="col">보낸사람</th>
						<th style="text-align: center;" scope="col">내용</th>
						<th style="text-align: center;" scope="col">날짜</th>

					</tr>
				</thead>
				<tbody>
					<!-- start row -->
					<c:forEach items="${updateMsgList }" var="msg" varStatus="i">
						<tr>
							<td style="text-align: center;" data-code="${msg.mesCode }"
								class="font-medium link">${empList.get(i.index).empName}</td>
							<td
								style="text-align: center; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${msg.mesContent }</td>
							<td style="text-align: center;"><fmt:formatDate
									value="${msg.mesDate }" pattern="yyyy/MM/dd"></fmt:formatDate></td>
						</tr>
					</c:forEach>
				</tbody>





			</table>



		</div>
		<div class="p-3 mt-4">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link"
						href="javascript:void(0)">Previous</a></li>
					<li class="page-item"><a class="page-link"
						href="javascript:void(0)">1</a></li>
					<li class="page-item"><a class="page-link"
						href="javascript:void(0)">2</a></li>
					<li class="page-item"><a class="page-link"
						href="javascript:void(0)">3</a></li>
					<li class="page-item"><a class="page-link"
						href="javascript:void(0)">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<script type="text/javascript">
const searchInput = document.getElementById('input');

//테이블 행(row) 요소들 가져오기
const rows = document.querySelectorAll('#custom_tool_ele tbody tr');

//검색어 입력란의 값이 변경될 때마다 실행되는 이벤트 핸들러 함수
searchInput.addEventListener('input', function(event) {
//검색어
const searchKeyword = event.target.value.trim().toLowerCase();

//각 행(row)마다 검색어를 포함하고 있는지 확인하고,
//포함하고 있지 않으면 화면에서 숨깁니다.
rows.forEach(row => {
const text = row.textContent.toLowerCase();
if (text.includes(searchKeyword)) {
 row.style.display = '';
} else {
 row.style.display = 'none';
}
});
});


//쪽지보내기 팝업창 띄우기
function openPopup() {
	  window.open("/message/write", "popup", "width=600, height=430, top=100, left=300");
	}



</script>