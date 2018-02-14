###############
FROM microsoft/dotnet:2.0-sdk  AS build-env
WORKDIR /solution

############################App Project Restore and Copy#########################
COPY ./WinContainerCoreApp/WinContainerCoreApp.csproj ./WinContainerCoreAppBuild/  
#Restore packages in App Project
RUN dotnet restore ./WinContainerCoreAppBuild/WinContainerCoreApp.csproj
COPY WinContainerCoreApp/. WinContainerCoreAppBuild/.

############################XUnit Testcases Project Restore and Copy#########################
COPY ./WinContainerCoreAppTest/WinContainerCoreAppTest.csproj ./WinContainerCoreAppTestBuild/  
#Restore packages in Unit Test Project
RUN dotnet restore ./WinContainerCoreAppTestBuild/WinContainerCoreAppTest.csproj
COPY WinContainerCoreAppTest/. WinContainerCoreAppTestBuild/.

###########################Run Unit Testcases And Mount in the Volume##################################
RUN dotnet test ./WinContainerCoreAppTestBuild/WinContainerCoreAppTest.csproj --logger trx
# "trx;LogFileName=testresult.trx"
WORKDIR ./WinContainerCoreAppTestBuild/TestResults/
RUN cp  . /var/lib/TestResult/

RUN dir
#RUN cat ./testresult.trx
############################Publish the app##########################################################
WORKDIR /solution
RUN dotnet publish ./WinContainerCoreAppBuild/WinContainerCoreApp.csproj -c Release -o out

FROM microsoft/aspnetcore 
WORKDIR /app  
EXPOSE 80
#Copy Published App
COPY --from=build-env solution/WinContainerCoreAppBuild/out .  
#Copy TRX File
#COPY --from=build-env /var/lib/TestResult/. ./TestResult
RUN dir

ENTRYPOINT ["dotnet", "WinContainerCoreApp.dll"]
