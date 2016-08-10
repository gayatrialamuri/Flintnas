@log.info("input is:"+ @input.to_s)

hostname=                  @input.get("hostname") #getting the values from JSON
hoststate=                 @input.get("hoststate")
hostaddress=               @input.get("hostaddress")
hoststatetype=             @input.get("hoststatetype")
servicename=               @input.get("servicename")
servicestate=              @input.get("servicestate")
SERVICESTATETYPE=          @input.get("SERVICESTATETYPE")
servicedesc=               @input.get("servicedesc")
hoststateid=               @input.get("servicestateid")
serviceeventid=            @input.get("serviceeventid")
serviceproblemid=          @input.get("serviceproblemid")
serviceexecutiontime=      @input.get("serviceexecutiontime")
SERVICEATTEMPT=            @input.get("SERVICEATTEMPT")
manageenginerequestid=     @input.get("MANAGE_ENGINE_REQUESTID")

@log.info("nas_mount was called for host "+ hostname +"Related incident Ticket Number : "+ manageenginerequestid )

   response=@call.connector("manageenginesdp")    
              .set("action","update-request")
              .set("request-id",manageenginerequestid.to_i)
              .set("requester","Flint Operator")
              .set("subject","Flint attempted mounting the NAS drive")
              .set("description","Flint will attempt to ssh to "+ hostaddress +" and mount "+ servicedesc)
              .set("requesttemplate","Unable to browse")
              .set("priority","Low")
              .set("site","-")
              .set("group","Network")
              .set("technician","Flint Operator")
              .set("level","Tier 3")
              .set("status","Close")
              .set("service",@service)
              .timeout(10000)                                                 
              .sync
    
#    result=response.get("result")
#    @log.info("#{result.to_s}")

if [servicestate == "CRITICAL" && SERVICESTATETYPE == "HARD"]       #service goes ‘Down’
  response=@call.connector("ssh")                                   #calling ssh connector   
	.set("target","192.168.1.163")
	.set("type","exec")             
	.set("username","root")
	.set("password","nagiosxi")
	.set("command","mount -t nfs -o nolock 192.168.1.121:/app1 /backup")     #mounting nas share
	.set("timeout",60000)
	.sync

  #SSH Connector Response Parameter
#  resultfromaction=response.get("result")
#  @log.info("#{resultfromaction.to_s}")



	  # closing request 
	response2=@call.connector("manageenginesdp")    
              .set("action","close-request")
              .set("request-id",manageenginerequestid.to_i)
              .set("close-accepted","Accepted")
              .set("close-comment","disk mounted successfully")                               
              .sync


#    resulti=response2.get("result")
#    @log.info("#{resulti.to_s}")

end

