package ex13;

import java.util.HashMap;

public class Car {
	private String model;
	private int year;
	private String maker;
	
	private static HashMap<String, String> carMap;	// For testing.
	
	public Car() {}

	public Car(String model, int year, String maker){
		this.model = model;
		this.year = year;
		this.maker = maker;
	}
	
	public void printInfo() {
		System.out.println("===Car Information===");
		System.out.println("model : " + this.model);
		System.out.println("year : " + this.year);
		System.out.println("maker : " + this.maker);
	}
	
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	
	public static void setCarMap(){
		carMap = new HashMap<String, String>();
		carMap.put("K5", "Kia");
		carMap.put("AW480", "Porshe");
		carMap.put("Genesis", "Hyundai");
		carMap.put("Bumblebee", "Ramborginey");
	}
	
	public static String getCarMap(String key){
		return carMap.get((String)key);
	}
}
