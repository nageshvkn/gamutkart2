package com.gamutkart;

public class App 
{
    public static void main( String[] args )
    {
		int i;
// testing continuous buids in Jenkins
		for(i=0;i<=40;i++)
		{
			i += 3;
        	System.out.println( "print number: " + i);
   		}
	 }
}
