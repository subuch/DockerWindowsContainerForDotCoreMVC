# DockerWindowsContainerForDotCoreMVC


Created a Docker Image for Restoring the packages, build the app(.NetCore App), run the unit test case(Xunit), publish the app within  the Windows Container. Find these changes in the DockerFile.

Prerequisite: 
1.	Install VS 2017 
2.	Install dotNetCore 2.0 SDK
3.	Azure Subscription
4.	Install Docker SDK
5.	Virtualization enablement using BIOS (Google it and find steps specific to the motherboard which are used)
6.	Install Hyper-V 

Used Docker-Compose.yml file for composing it and mount a volume(Docker Concept) to transfer files(eg: TRX file. Test result after execution) from container to local machine and vice-versa(this is optional).

Commands for build and running the docker image. Run the below commands from the root of the project using cmd or powershell.

>>docker-compose build 

>>docker-compose up

>>docker images (chk if your images exist in the pool of images)

>> docker ps(to check if the container is running)

>>Goto http://localhost:7573 to verify the app

This image can be pushed to public registry(Docker Hub) or any private registry like Azure Container Registry(ACR). 





 


