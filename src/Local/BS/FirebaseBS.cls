Class Local.BS.FirebaseBS Extends Ens.BusinessService
{

Parameter ADAPTER = "Local.Adapter.FirebaseInboundAdapter";

Method OnProcessInput(pRequest As Local.Message.FirebaseDocRequest, pResponse As %RegisteredObject) As %Status
{
        $$$TRACE(pRequest.Doc)

        Quit $$$OK
}

}
