import java.util.Scanner;

public class DemoJava2 {
	public static void main(String[] args){
//		for (int i=1; i<=10;){
//			System.out.println(i);
//			System.out.println("Lesstion " + i);
//			i++;
//		}
//		int[] points = {1,2,3,4,5};
//		
//		for(int point : points){
//			System.out.println(point);
//		}
//		int i = 1;
//		while(i <=10){
//			System.out.println(i);
//			i++;
//		}
		
//		int i = 1;
//		do{
//			System.out.println(i);
//			i++;
//		}
//		while(i <= 2);
		Scanner scanner = new Scanner(System.in);
		System.out.println("Moi ban nhap vao ten: ");
		String ten = scanner.nextLine();
		System.out.println(ten);
		
		System.out.println("Moi ban nhap vao tuoi");
		int tuoi = scanner.nextInt();
		System.out.println(tuoi);
		
	}

}
