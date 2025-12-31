#!/bin/bash

# Fake LLM Agent API 테스트 - curl 샘플

BASE_URL="http://localhost:8000"

echo "=== Fake LLM Agent API curl 샘플 ==="
echo

# 루트 엔드포인트 - 기본 정보 확인
echo "1. 루트 엔드포인트 확인"
curl -X GET "$BASE_URL/"
echo -e "\n"

# 간단한 채팅 API - 일반 메시지
echo "2. 간단한 채팅 API - 일반 메시지"
curl -X POST "$BASE_URL/chat/simple" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "안녕하세요!"
  }'
echo -e "\n"

# 간단한 채팅 API - 이름 질문
echo "3. 간단한 채팅 API - 이름 질문"
curl -X POST "$BASE_URL/chat/simple" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "당신의 이름은 무엇인가요?"
  }'
echo -e "\n"

# 간단한 채팅 API - 날씨 질문
echo "4. 간단한 채팅 API - 날씨 질문"
curl -X POST "$BASE_URL/chat/simple" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "오늘 날씨가 어때요?"
  }'
echo -e "\n"

# OpenAI 스타일 API - 간단한 인사
echo "5. OpenAI 스타일 API - 간단한 인사"
curl -X POST "$BASE_URL/chat/completions" \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [
      {
        "role": "user",
        "content": "안녕하세요!"
      }
    ],
    "temperature": 0.7,
    "max_tokens": 100
  }'
echo -e "\n"

# OpenAI 스타일 API - 이름 질문
echo "6. OpenAI 스타일 API - 이름 질문"
curl -X POST "$BASE_URL/chat/completions" \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [
      {
        "role": "user",
        "content": "당신의 이름은 무엇인가요?"
      }
    ],
    "temperature": 0.7,
    "max_tokens": 100
  }'
echo -e "\n"

# OpenAI 스타일 API - 날씨 질문
echo "7. OpenAI 스타일 API - 날씨 질문"
curl -X POST "$BASE_URL/chat/completions" \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [
      {
        "role": "user",
        "content": "오늘 날씨가 어때요?"
      }
    ],
    "temperature": 0.7,
    "max_tokens": 100
  }'
echo -e "\n"

# OpenAI 스타일 API - 대화형 예시 (여러 메시지)
echo "8. OpenAI 스타일 API - 대화형 예시"
curl -X POST "$BASE_URL/chat/completions" \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [
      {
        "role": "user",
        "content": "안녕하세요!"
      },
      {
        "role": "assistant",
        "content": "안녕하세요! 무엇을 도와드릴까요?"
      },
      {
        "role": "user",
        "content": "Python에 대해 알려주세요"
      }
    ],
    "temperature": 0.5,
    "max_tokens": 150
  }'
echo -e "\n"

# OpenAI 스타일 API - 높은 temperature 설정
echo "9. OpenAI 스타일 API - 높은 temperature (창의적)"
curl -X POST "$BASE_URL/chat/completions" \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [
      {
        "role": "user",
        "content": "창의적인 이야기를 들려주세요"
      }
    ],
    "temperature": 1.0,
    "max_tokens": 200
  }'
echo -e "\n"

# OpenAI 스타일 API - 낮은 temperature 설정
echo "10. OpenAI 스타일 API - 낮은 temperature (정확한)"
curl -X POST "$BASE_URL/chat/completions" \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [
      {
        "role": "user",
        "content": "프로그래밍에 대해 설명해주세요"
      }
    ],
    "temperature": 0.1,
    "max_tokens": 100
  }'
echo -e "\n"

echo "=== 모든 테스트 완료 ==="