package ex13;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Car_Main {
	public static void main(String[] args) {
		Car.setCarMap();
		ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
		
		for(int i=1; i<=2; i++) {
			Car test_car = (Car)context.getBean("car"+i);
			test_car.printInfo();
		}
	}
}
