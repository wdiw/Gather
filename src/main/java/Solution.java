import java.util.Iterator;

class Solution {
	public static void main(String[] args) {
    	int[] nums = {1,1,2,12,2,3};
    	
    }
	    public int[] twoSum(int[] nums, int target) {
	        int[] answear = new int[2];
	        int x = nums.length;
	        for(int i=0;i<nums.length;i++){
	            if(nums[i]<target){
	                for(int j=i+1;j<nums.length;j++){
	                    if(nums[i]+nums[j]==target){
	                        answear[0]=i;
	                        answear[1]=j;
	                        break;
	                    }           
	                }
	            }
	        }
			return answear;
	        
	    }
}