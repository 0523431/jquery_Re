<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	{} 객체
	key 값 : properties
	value 값 : 배열 [] 3개
			----------> json형태로 key와 value가 들어가있음
						key : address / price / commnet
						value : 각 내용들
	
--%>
{
	"properties" : [
		{ "address" : "서울시 종로구 가회동 100번지",
		  "price" : "5000",
		  "comment" : "조용하고 좋은 이웃"
		},
		
		{ "address" : "서울시 종로구 역삼동 100번지",
		  "price" : "50000",
		  "comment" : "학교, 백화점 등 편의 시설 좋음"
		},
		
		{ "address" : "경기도 부천시 역곡동 100번지",
		  "price" : "30000",
		  "comment" : "교통좋고, 공기 좋음"
		}
	]
}