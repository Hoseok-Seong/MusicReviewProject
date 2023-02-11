package shop.mtcoding.blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.blog.dto.user.UserReqDto.JoinReqDto;
import shop.mtcoding.blog.handler.exception.CustomException;
import shop.mtcoding.blog.model.User;
import shop.mtcoding.blog.model.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public void 가입하기(JoinReqDto joinReqDto) {
        // 1. 유저 유효성 검사
        User sameuser = userRepository.findByName(joinReqDto.getUsername());

        if (sameuser != null) {
            throw new CustomException("동일한 아이디가 존재합니다");
        }
        // 2. db에 insert하기
        int result = userRepository.insert(joinReqDto.getUsername(), joinReqDto.getPassword(), joinReqDto.getEmail());

        if (result != 1) {
            throw new CustomException("회원가입이 실패하였습니다");
        }
    }
}
