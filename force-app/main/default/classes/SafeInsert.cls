/*****************************************************************************************************
 
Class    :  SafeInsert
Developer:  Krishna Kollu, Blue Wolf Group LLC
Created  :  Feb 12, 2014
Modified :  March 14, 2014
Objective:  This class is used to gracefully handle error messages when inserting objects
 
*****************************************************************************************************/ 
public class SafeInsert extends SafeDML {
	private List<SObject> objectsToInsert;
	private List<ErrorHandling.ErrorHandler> errorhandlers;
	
	public SafeInsert()
	{
		newQueue();
	}
	
	private void newQueue()
	{
		objectsToInsert = new List<SObject>();
		errorhandlers = new List<ErrorHandling.ErrorHandler>();
	}
	
	private List<SObject> getObjectsForProcessing()
	{
		return objectsToInsert;
	}
	
	private ErrorHandling.ErrorHandler getErrorHandlerForObject(Integer indexOfObject)
	{
		return errorhandlers[indexOfObject];
	}
	
	private void dmlOperation_AllOrNone()
	{
		insert objectsToInsert;
	}
	
	private DatabaseOperationResults dmlOperation_AllowPartialSuccess()
	{
		return new DatabaseOperationResults(Database.insert( objectsToInsert, false ));
	}
	
	/* 
	Add the specified objects to be inserted. If there is an error upon inserting any of these objects, handle the error
	with the specified error handler
	 
	Preconditions:
		1) The queue either has no SObjects or has SObjects of the same type as the parameter (This is to avoid chunking)
	*/
	public override void queue(List<SObject> objects, ErrorHandling.ErrorHandler errorHandler)
	{
		for(SObject o : objects)
		{
			if(errorHandler!=null) errorHandler.validate(o);
			objectsToInsert.add(o);
			errorhandlers.add(errorHandler);
		}
	} 
	
	public override Integer getQueueSize()
	{
		return objectsToInsert.size();
	}
}