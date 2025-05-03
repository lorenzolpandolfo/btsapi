from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel
from sqlalchemy import Column, Integer, String, Date, Text, ForeignKeyConstraint
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.future import select
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession

DATABASE_URL = "postgresql+asyncpg://user:password@localhost/btsdb"

engine = create_async_engine(DATABASE_URL, echo=True)
SessionLocal = sessionmaker(
    bind=engine,
    class_=AsyncSession,
    expire_on_commit=False,
)

Base = declarative_base()


class MemberModel(Base):
    __tablename__ = "member"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    full_name = Column(String, nullable=False)
    birth_date = Column(Date, nullable=False)
    birth_city = Column(Text, nullable=False)
    picture = Column(Text, nullable=False)
    first_solo_song = Column(Text, nullable=False)


app = FastAPI()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@app.get("/members")
async def get_member(db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(MemberModel))
    members = result.scalars().all()
    return [
        {
            "id": m.id,
            "name": m.name,
            "full_name": m.full_name,
            "birth_date": m.birth_date,
            "birth_city": m.birth_city,
            "picture": m.picture,
            "first_solo_song": m.first_solo_song,
        }
        for m in members
    ]


@app.get("/member/{name}")
async def get_member(name: str, db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(MemberModel).filter(MemberModel.name == name))
    member = result.scalars().first()

    if member is None:
        return HTTPException(status_code=404, detail="Member not found.")

    return {
        "id": member.id,
        "name": member.name,
        "full_name": member.full_name,
        "birth_date": member.birth_date,
        "birth_city": member.birth_city,
        "picture": member.picture,
        "first_solo_song": member.first_solo_song,
    }
