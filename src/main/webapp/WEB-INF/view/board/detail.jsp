<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
    <div class="container my-3">
            <div class="mb-3">
                <a href="/board/updateForm" class="btn btn-warning">수정</a>
                <button class="btn btn-danger">삭제</button>
            </div>


        <div class="mb-2 text-white">
            글 번호 : <span id="id"><i>1 </i></span> 작성자 : <span><i>나 </i></span>
            <i id="heart" class="fa-regular fa-heart ms-2 my-cursor" value=""></i>
        </div>

        <div class="text-white">
            <h3>제목</h3>
        </div>
        <hr />
        <div class="text-white">
            <div>내용</div>
        </div>
        <hr />

        <div class="card">
            <form action="/reply" method="post">
                <input type="hidden" name="boardId" value="">
                <div class="card-body">
                    <textarea name="comment" id="reply-comment" class="form-control" rows="1"></textarea>
                </div>
                <div class="card-footer">
                    <button type="submit" id="btn-reply-save" class="btn btn-primary">등록</button>
                </div>
            </form>
        </div>
        <br />
        <div class="card">
            <div class="card-header">댓글 리스트</div>
            <ul id="reply-box" class="list-group">
                <li id="reply" class="list-group-item d-flex justify-content-between">
                    <div>댓글</div>
                    <div class="d-flex">
                        <div class="font-italic">작성자 : 이름</div>
                        <button class="badge bg-secondary">삭제</button>
                    </div>
                </li>
            </ul>
        </div>
    </div>
<%@ include file="../layout/footer.jsp" %>