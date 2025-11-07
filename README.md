# Database Schema

# 

# \*\*PostgreSQL 데이터베이스 구조\*\*입니다.  

# pgAdmin을 통해 생성 및 백업하였으며, 서버와 연동해야 합니다.

# 

# ---

# 

# DB Information

# 

# -DBMS: PostgreSQL 17  

# \- Exported by: pgAdmin (`pg\_dump`)  

# \- 파일 위치: `/sql/schema.sql`   

# \- 구성 목적: 퀴즈, 피싱 시나리오, 사용자 세션, 응답 로그 관리  

# 

# ---

# 

# 테이블 구조

# 

# | 테이블명 | 설명 |

# |-----------|------|

# | `users` | 사용자 계정 및 등록 정보 |

# | `phishing\_scenarios` | 피싱 시나리오 데이터 |

# | `quiz\_questions` | 퀴즈 문제 및 정답 정보 |

# | `quiz\_sessions` | 유저별 퀴즈 진행 세션 |

# | `quiz\_responses` | 유저의 퀴즈 응답 기록 |

# | `api\_logs` | AI/서버 API 호출 로그 |

# 



