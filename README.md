# CI/CD Pipeline Automation System

## Project Overview

This project demonstrates a Continuous Integration and Continuous Delivery (CI/CD) workflow for a Python Flask web application. It automates application testing, Docker image building, and publishing through GitHub Actions and Docker Hub.

Whenever code is pushed to the `main` branch, GitHub Actions runs automated tests. If the tests pass, the workflow builds a Docker image and publishes it to Docker Hub.

The project also includes a deployment script that automates running the published Docker image in a Docker-enabled environment.

## Objectives

- Implement an automated CI/CD pipeline.
- Develop a Python Flask application with health-check endpoints.
- Automate application testing using Python unit tests.
- Build Docker images for application deployment.
- Publish Docker images to Docker Hub.
- Automate container deployment using a Bash script.

## Technologies Used

| Technology | Purpose |
|---|---|
| Python 3.12 | Application development |
| Flask | Web application framework |
| Python unittest | Automated testing |
| GitHub Actions | CI/CD automation |
| Docker | Containerization |
| Docker Hub | Container image registry |
| GitHub | Source code management |

## Application Endpoints

| Endpoint | Description |
|---|---|
| `/` | Returns application information in JSON format |
| `/health` | Returns the application health status |

## CI/CD Workflow

1. Code is pushed to the `main` branch.
2. GitHub Actions checks out the repository.
3. Python dependencies are installed.
4. Automated tests validate the homepage and health endpoint.
5. If the tests pass, a Docker image is built.
6. The Docker image is published to Docker Hub with the `latest` tag.

Pull requests targeting the `main` branch trigger the automated testing job.

## Docker Image

**Docker Hub image:** https://hub.docker.com/r/sapnaahamed/cicd-pipeline-automation

Pull the published image:

```bash
docker pull sapnaahamed/cicd-pipeline-automation:latest
```

## Run Locally

Install dependencies:

```bash
pip install -r requirements.txt
```

Start the Flask application:

```bash
python app.py
```

Open the application at:

```text
http://localhost:5000
```

## Run Automated Tests

Execute the unit tests:

```bash
python -m unittest -v
```

## Run with Docker

After installing Docker, run:

```bash
docker run -d --name cicd-app -p 5000:5000 sapnaahamed/cicd-pipeline-automation:latest
```

Open the application at:

```text
http://localhost:5000
```

## Automated Docker Deployment

The project includes a `deploy.sh` script that automates deployment of the latest Docker image from Docker Hub.

The script performs the following operations:

1. Pulls the latest Docker image.
2. Removes the previous application container if it exists.
3. Starts a new container with automatic restart enabled.
4. Checks the `/health` endpoint.
5. Displays container logs and exits with an error if the health check fails.

Run the script in an environment with Docker, Bash, and curl installed:

```bash
bash deploy.sh
```

**Note:** The deployment script is executed manually. The GitHub Actions workflow handles automated testing, image building, and publishing.

## Monitoring and Troubleshooting

Check running containers:

```bash
docker ps
```

View application logs:

```bash
docker logs cicd-app
```

Check application health:

```bash
curl http://localhost:5000/health
```

The application was tested in GitHub Codespaces. This is a temporary development and testing environment, not a permanent public deployment.

## Screenshots

Visual evidence of the project is available in the [screenshots](https://github.com/sapnaahamed23-hub/cognevance_cicd-pipeline-automation/tree/main/screenshots) directory.

Include screenshots showing:

- GitHub Actions workflow execution.
- Successful automated test results.
- Docker image publishing.
- Docker Hub repository and image tag.
- Application health-check response.

Use the actual filenames available in the screenshots directory.

## Project Links

- **GitHub Repository:** https://github.com/sapnaahamed23-hub/cognevance_cicd-pipeline-automation
- **GitHub Actions:** https://github.com/sapnaahamed23-hub/cognevance_cicd-pipeline-automation/actions
- **Docker Hub Image:** https://hub.docker.com/r/sapnaahamed/cicd-pipeline-automation

## Future Improvements

- Deploy the application to a cloud hosting platform.
- Introduce automated deployment to a cloud environment.
- Add container vulnerability scanning.
- Integrate advanced monitoring and logging.
- Implement deployment rollback strategies.

## Conclusion

This project provided practical experience in CI/CD automation, automated testing, Docker containerization, and container image publishing. It demonstrates how application code can move through an automated testing and image-publishing pipeline, establishing a foundation for more advanced DevOps and cloud deployment workflows.
