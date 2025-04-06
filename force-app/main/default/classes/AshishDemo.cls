public class AshishDemo {
    public static void getAccountdetails(){
	Account acc = [Select Id,Name from Account where Name='Test Trigger'];
        System.debug('Id'+acc.Id);
        System.debug('Name'+acc.Name);
    }
    public static void sumoftwonumbers(Integer a,Integer b){
        Integer result = a+b;
        System.debug('sum of a and b-->'+result);
    }
  }