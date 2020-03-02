package mpicker.com.a.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect	// Annotation으로 자동호출 함수 매핑하기
public class LogAop {
	// logger AOP
	// 자동적으로 호출되는 함수
	
	@Around("within(mpicker.com.a.controller.*)")	// 자동호출하고자 하는 클래스 지정
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable {
		String signitureStr = joinpoint.getSignature().toShortString();
		Object obj;
		// 사용자가 지정한 함수를 실행했을 때 아래 함수가 실행, 리턴
		try {
			System.out.println("loggerAOP: " + signitureStr + " method execute");
			obj	= joinpoint.proceed();
			return obj;
		}finally {
		}
	}
}
