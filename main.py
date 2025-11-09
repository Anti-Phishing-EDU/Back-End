from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware  # ✅ CORS 미들웨어 추가

app = FastAPI()

# ✅ CORS 설정
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 모든 출처 허용 (개발용)
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def read_root():
    return {"message": "FastAPI 서버가 정상 작동 중입니다 🚀"}
