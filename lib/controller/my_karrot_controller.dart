import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyKarrotController extends GetxController {
  List<String> myKarrotListOptions = [
    '내 동네 설정',
    '동네 인증하기',
    '키워드 알림',
    '당근가계부',
    '모아보기',
    '관심 카테고리 설정',
    '동네생활 글',
    '동네생활 댓글',
    '비즈프로필 만들기',
    '동네홍보 글',
    '지역광고',
    '친구초대',
    '당근마켓 공유',
    '공지사항',
    '자주 묻는 질문',
    '앱 설정',
  ];

  List<IconData> myKarrotListIconOptions = [
    Icons.fmd_good_outlined,
    Icons.gps_not_fixed_outlined,
    Icons.local_offer_outlined,
    Icons.menu_book_outlined,
    Icons.apps_outlined,
    Icons.tune,
    Icons.note_alt_outlined,
    Icons.chat_bubble_outline_rounded,
    Icons.add_business_outlined,
    Icons.note_outlined,
    Icons.sticky_note_2_outlined,
    Icons.speaker_outlined,
    Icons.email,
    Icons.share,
    Icons.mic_none_outlined,
    Icons.phone_outlined,
    Icons.settings_outlined,
  ];

  void myKarrotListViewOnTap(String optionName) {
    if (optionName == '내 동네 설정') {
      // 내 동네 설정으로 이동
    } else if (optionName == '동네 인증하기') {
      // 동네 인증하기로 이동
    } else if (optionName == '키워드 알림') {
      // 키워드 알림으로 이동
    } else if (optionName == '당근가계부') {
      // 당근가계부로 이동
    } else if (optionName == '모아보기') {
      // 모아보기로 이동
    } else if (optionName == '관심 카테고리 설정') {
      // 관심 카테고리 설정으로 이동
    } else if (optionName == '동네생활 글') {
      // 동네생활 글로 이동
    } else if (optionName == '동네생활 댓글') {
      // 동네생활 댓글으로 이동
    } else if (optionName == '비즈프로필 만들기') {
      // 비즈프로필 만들기로 이동
    } else if (optionName == '동네홍보 글') {
      // 동네홍보 글로 이동
    } else if (optionName == '지역광고') {
      // 지역광고로 이동
    } else if (optionName == '친구초대') {
      // 친구초대로 이동
    } else if (optionName == '당근마켓 공유') {
      // 당근마켓 공유로 이동
    } else if (optionName == '공지사항') {
      // 공지사항로 이동
    } else if (optionName == '자주 묻는 질문') {
      // 자주 묻는 질문로 이동
    } else if (optionName == '앱 설정') {
      // 앱 설정으로 이동
    }
  }
}
