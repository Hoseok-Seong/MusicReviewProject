<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="container my-3">
            <c:if test="${boardDto.userId == principal.id}">
                <div class="mb-3">
                    <a href="/board/updateForm" class="btn btn-warning">수정</a>
                    <button class="btn btn-danger">삭제</button>
                </div>
            </c:if>

            <div class="mb-2 text-white">
                글 번호 : <span id="id"><i>${boardDto.id} </i></span> 작성자 : <span><i>${boardDto.username} </i></span>
                <i id="heart" class="fa-regular fa-heart ms-2 my-cursor" value=""></i>
            </div>

            <div class="text-white">
                <h3>${boardDto.title}</h3>
            </div>
            <hr />
            <div class="text-white">
                <div>${boardDto.content}</div>
            </div>
            <hr />

            <div class="card">
                <form>
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
                    <li id="reply-${reply.id}" class="list-group-item d-flex justify-content-between">
                        <div>댓글</div>
                        <div class="d-flex">
                            <div class="font-italic">작성자 : 나</div>
                            <button class="badge bg-secondary">삭제</button>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <%@ include file="../layout/footer.jsp" %>