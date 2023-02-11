package shop.mtcoding.blog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.blog.dto.ResponseDto;
import shop.mtcoding.blog.dto.board.BoardReqDto.BoardSaveReqDto;
import shop.mtcoding.blog.handler.exception.CustomApiException;
import shop.mtcoding.blog.model.BoardRepository;
import shop.mtcoding.blog.model.User;
import shop.mtcoding.blog.service.BoardService;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private HttpSession session;

    @Autowired
    private BoardRepository boardRepository;

    @GetMapping({ "/", "/board" })
    public String main(Model model) {
        model.addAttribute("dtos", boardRepository.findAllWithUser());
        return "/board/main";
    }

    @GetMapping("/board/detail")
    public String detail() {
        return "/board/detail";
    }

    @GetMapping("/board/{id}")
    public String detail(@PathVariable int id, Model model) {
        model.addAttribute("boardDto", boardRepository.findByIdWithUser(id));
        return "/board/detail";
    }

    @GetMapping("/board/saveForm")
    public String saveForm() {
        return "/board/saveForm";
    }

    @PostMapping("/board")
    public @ResponseBody ResponseEntity<?> save(@RequestBody BoardSaveReqDto boardSaveReqDto) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 실패했습니다", HttpStatus.UNAUTHORIZED);
        }
        if (boardSaveReqDto.getTitle() == null ||
                boardSaveReqDto.getTitle().isEmpty()) {
            throw new CustomApiException("제목을 작성해주세요");
        }

        if (boardSaveReqDto.getTitle().length() > 100) {
            throw new CustomApiException("제목의 길이는 100자 이하까지 가능합니다");
        }

        if (boardSaveReqDto.getContent() == null ||
                boardSaveReqDto.getContent().isEmpty()) {
            throw new CustomApiException("글 내용을 작성해주세요");
        }

        boardService.글쓰기(boardSaveReqDto, principal.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "글쓰기 성공", null), HttpStatus.CREATED);
    }

    @DeleteMapping("/board/{id}")
    public @ResponseBody ResponseEntity<?> delete(@PathVariable int id) {
        User principal = (User) session.getAttribute("principal");
        if (principal == null) {
            throw new CustomApiException("인증이 실패했습니다", HttpStatus.UNAUTHORIZED);
        }

        boardService.게시글삭제(id, principal.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "삭제 성공", null), HttpStatus.OK);
    }

    @GetMapping("/board/updateForm")
    public String boardUpdateForm() {
        return "/board/boardUpdateForm";
    }

}
