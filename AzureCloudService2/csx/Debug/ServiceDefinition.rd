<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureCloudService2" generation="1" functional="0" release="0" Id="fb936db1-016e-41c1-a9d3-438243582458" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureCloudService2Group" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="WebApplication1:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AzureCloudService2/AzureCloudService2Group/LB:WebApplication1:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="WebApplication1:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudService2/AzureCloudService2Group/MapWebApplication1:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="WebApplication1Instances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureCloudService2/AzureCloudService2Group/MapWebApplication1Instances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:WebApplication1:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AzureCloudService2/AzureCloudService2Group/WebApplication1/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapWebApplication1:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudService2/AzureCloudService2Group/WebApplication1/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapWebApplication1Instances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureCloudService2/AzureCloudService2Group/WebApplication1Instances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="WebApplication1" generation="1" functional="0" release="0" software="C:\Users\Asierae\Documents\Visual Studio 2013\Projects\WebApplication1\AzureCloudService2\csx\Debug\roles\WebApplication1" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;WebApplication1&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;WebApplication1&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureCloudService2/AzureCloudService2Group/WebApplication1Instances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureCloudService2/AzureCloudService2Group/WebApplication1UpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureCloudService2/AzureCloudService2Group/WebApplication1FaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="WebApplication1UpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="WebApplication1FaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="WebApplication1Instances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="e6c980ba-3bd5-4198-b692-1ad510e91e19" ref="Microsoft.RedDog.Contract\ServiceContract\AzureCloudService2Contract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="e7d80292-0943-4d73-a47b-7a9b4c91083a" ref="Microsoft.RedDog.Contract\Interface\WebApplication1:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/AzureCloudService2/AzureCloudService2Group/WebApplication1:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>