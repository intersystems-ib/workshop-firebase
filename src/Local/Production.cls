Class Local.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Local.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Local.BS.FirebaseBS" Category="" ClassName="Local.BS.FirebaseBS" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="DocName">data_poc</Setting>
    <Setting Target="Adapter" Name="KeyPath">/shared/key/firebase-key.json</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
</Production>
}

}
