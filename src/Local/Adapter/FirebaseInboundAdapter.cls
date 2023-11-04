Class Local.Adapter.FirebaseInboundAdapter Extends Ens.InboundAdapter
{

Property KeyPath As %String(MAXLEN = 100);

Property DocName As %String(MAXLEN = 100);

Parameter SETTINGS = "KeyPath,DocName";

Method OnTask() As %Status
{
    $$$TRACE("Connecting")
    set tSC = $$$OK
    set listOfDocs = ##class("%Library.ListOfDataTypes").%New()
    if ('$DATA(^$GLOBAL("^LASTFIREBASE"))) {
        set ^LASTFIREBASE(..DocName) = 0
    }
    
    do ..ConnectAndQuery(..KeyPath, ^LASTFIREBASE(..DocName), listOfDocs, ..DocName)

    for i = 1:1:listOfDocs.Count() {
        set msg = ##class(Local.Message.FirebaseDocRequest).%New()
        set msg.Doc = listOfDocs.GetAt(i)
        set tSC=..BusinessHost.ProcessInput(msg)
        set docRead = ##class(%DynamicAbstractObject).%FromJSON(msg.Doc)
        set ^LASTFIREBASE(..DocName) = docRead.id
        $$$TRACE("Index: "_^LASTFIREBASE(..DocName))
    }
    $$$TRACE("Finishing connection")

    Quit tSC
}

/// Using Embedded Python to connect with Firebase
ClassMethod ConnectAndQuery(keyPath As %String, lastId As %String, ByRef listOfDocs As %List, docName As %String) [ Language = python ]
{
        import iris
        import firebase_admin
        from firebase_admin import credentials
        from firebase_admin import firestore

        if not firebase_admin._apps:
            cred = credentials.Certificate(keyPath)
            firebase_admin.initialize_app(cred)

        db = firestore.client()

        # Read Data
        docs_refer = db.collection(docName)
        docs = docs_refer.where("id",">",lastId).stream()
        # docs = docs_refer.stream()

        for doc in docs:
            listOfDocs.Insert(str(doc.to_dict()).replace("'", '"'))
        return 1
}

}
