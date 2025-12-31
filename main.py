from fastapi import FastAPI
from pydantic import BaseModel
import random
import time
from typing import Optional, List

app = FastAPI(title="Fake LLM Agent", description="간단한 가짜 LLM API", version="1.0.0")

class Message(BaseModel):
    role: str
    content: str

class ChatRequest(BaseModel):
    messages: List[Message]
    temperature: Optional[float] = 0.7
    max_tokens: Optional[int] = 100

class ChatResponse(BaseModel):
    choices: List[dict]
    usage: dict

class SimpleResponse(BaseModel):
    response: str

fake_responses = [
    "안녕하세요! 저는 가짜 AI 어시스턴트입니다.",
    "흥미로운 질문이네요. 생각해보니...",
    "네, 이해했습니다. 다음과 같이 답변드릴게요:",
    "좋은 아이디어입니다! 더 자세히 설명드리면...",
    "물론입니다. 제가 도와드릴 수 있습니다.",
    "그것은 정말 중요한 포인트네요.",
    "죄송하지만 정확한 답변을 드리기 어렵습니다.",
    "더 많은 정보가 필요할 것 같습니다."
]

@app.get("/")
async def root():
    return {"message": "Fake LLM Agent API입니다. /docs로 가서 API를 확인해보세요!"}

class SimpleRequest(BaseModel):
    message: str

@app.post("/chat/simple", response_model=SimpleResponse)
async def simple_chat(request: SimpleRequest):
    response = random.choice(fake_responses)
    return SimpleResponse(response=f"{response} (입력: '{request.message}')")

@app.post("/chat/completions", response_model=ChatResponse)
async def chat_completions(request: ChatRequest):

    last_message = request.messages[-1].content if request.messages else ""
    response_text = random.choice(fake_responses)
    
    if "안녕" in last_message:
        response_text = "안녕하세요! 무엇을 도와드릴까요?"
    elif "이름" in last_message:
        response_text = "저는 가짜 AI 어시스턴트입니다!"
    elif "날씨" in last_message:
        response_text = "죄송하지만 실시간 날씨 정보는 제공할 수 없습니다."
    
    return ChatResponse(
        choices=[{
            "message": {
                "role": "assistant",
                "content": response_text
            },
            "finish_reason": "stop"
        }],
        usage={
            "prompt_tokens": len(last_message.split()),
            "completion_tokens": len(response_text.split()),
            "total_tokens": len(last_message.split()) + len(response_text.split())
        }
    )

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
