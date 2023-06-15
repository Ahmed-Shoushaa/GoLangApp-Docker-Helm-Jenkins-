
# GoServerApp with (Docker, Helm, and Jenkins)
This project demonstrates the deployment of a Go HTTP server application using Docker, Jenkins, Docker Compose, and Kubernetes with Helm.

## Project Structure
- **Dockerfile**: Contains the instructions to build the Go HTTP server app into a Docker image.
- **Jenkinsfile**: Defines the Jenkins pipeline job for building the app using the Dockerfile and reporting any build errors. It also pushes the Docker image to Docker Hub.
- **docker-compose.yaml**: Defines the Docker Compose file that includes both the Go application and a MySQL database, allowing you to run the app locally.
- **Helm-chart/**: Contains Helm manifests for deploying the app on Kubernetes, with added configuration for high availability and volume persistence.
- **README.md**: This file.
## Building the Go App using Dockerfile
I created a Dockerfile to create a GoApp image and i cared about:
- Using base image **golang:alpine** to make it lightweight


To build the Go app and create a Docker image, follow these steps:

1. Install Docker on your machine.
2. cd to the Dockerfile location

3. Run the following command to build the Docker image locally:

```bash
docker build -t your-dockerhub-username/goapp .
```
   Replace your-dockerhub-username with your Docker Hub username.

4. After a successful build, you can push the Docker image to Docker Hub:
```bash
docker push your-dockerhub-username/goapp
```
   Ensure that you are logged in to Docker Hub before pushing the image.

## Running the App Locally with Docker Compose
To run the Go app and MySQL database locally, use Docker Compose:

1. Install Docker Compose on your machine.

2. Ensure that the Docker Compose file (docker-compose.yaml) is present in the project directory.

3. Open a terminal or command prompt and navigate to the project directory.

4. Run the following command to start the containers:
```bash
docker-compose up
```
   The Go app and MySQL database will be deployed and running locally.
 
 You can access it using 
 ```bash
curl localhost:9090
```
<p align="center">
<img src="https://user-images.githubusercontent.com/117172376/246065504-c58385d6-1249-44ed-8c5e-674681680437.png"/>
</p>

## Deploying the App on Kubernetes with Helm
   Note: I used KillerKoda Playground in this section as it is a ready environment with k8s and helm installed

To deploy the Go app on Kubernetes using Helm and enable high availability and volume persistence, follow these steps:

1. Open the KillerKoda Playground website at [playground.killerkoda.com](https://playground.killerkoda.com) and choose one of the k8s playgrounds or do it on local machine with k8s cluster and helm installed

2. Copy and paste the contents of the `helm/` directory into the editor on the KillerKoda Playground or clone this repo using
```bash
git clone https://github.com/Ahmed-Shoushaa/golang.git
```

3. Modify the Helm values file (`values.yaml`) to customize the deployment configuration as needed.

4. Run Helm chart using  Click on the "Run" button to deploy the app on the simulated Kubernetes environment in the playground.
```bash
helm install try1 ./Helm-chart
```
  replace ./Helm-chart with your helm chart directory

5. After a successful deployment, you can access the Go app using the provided service URL within the KillerKoda Playground and you can see the objects successfully deployed

<p align="center">
<img src="https://user-images.githubusercontent.com/117172376/246065423-f7a9d43d-03a8-421b-8c1a-71ab9c65fc70.png"/>
</p>

<p align="center">
<img src="https://user-images.githubusercontent.com/117172376/246065415-9450cb88-8656-41e6-a119-718bd2a847db.png"/>
</p>

## CI with Jenkins

To build the Go app using Jenkins and create a Docker image, follow these steps:

   Note: I tried to make the jenkinsfile simple without the need to download external plugins

1. Set up a Jenkins server .

2. Create a new Jenkins pipeline job.

3. Configure the pipeline job to use the provided `Jenkinsfile` as the pipeline script.
<p align="center">
<img src="https://user-images.githubusercontent.com/117172376/246065459-910e5ca2-7882-4687-8c7d-1fad8fa049f5.png"/>
</p>

4. Add your DockerHub UserName and Password to the Jenkinsfile in the push stage
5. I generated the SCM from **pipeline syntax** to clone the git hub repo following these steps
<p align="center">
<img src="https://user-images.githubusercontent.com/117172376/246065471-7e027274-996e-4737-9878-9601debb0b81.png"/>
</p>
<p align="center">
<img src="https://user-images.githubusercontent.com/117172376/246065484-2455b533-4b4b-4b1b-b15f-7ab5405b12a3.png"/>
</p>
<p align="center">
<img src="https://user-images.githubusercontent.com/117172376/246065491-c7d13304-a19b-4486-93af-03ceba39ba07.png"/>
</p>

6. Then i added that checkout scm Git to my **clone repository stage**.

7. Run the Jenkins pipeline job.

6. Jenkins will execute the steps defined in the Jenkinsfile, which includes building the Go app using the Dockerfile and pushing the Docker image to your Docker Hub repository.
<p align="center">
<img src="https://user-images.githubusercontent.com/117172376/246065451-bfbcf464-84fd-4c40-ac65-bf37790b0a33.png"/>
</p>
