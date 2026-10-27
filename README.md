# CI/CD Pipeline Automation System

A beginner-friendly DevOps project that automates testing, Docker image building, and publishing using GitHub Actions and Docker Hub.

## Project Overview

This project demonstrates a continuous integration and continuous delivery (CI/CD) workflow for a Python Flask web application. When code is pushed to the `main` branch, GitHub Actions runs automated tests and, if they pass, builds and publishes a Docker image to Docker Hub.

## Technologies Used

- Python 3.12
- Flask
- GitHub Actions
- Docker
- Docker Hub
- GitHub

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
5. After successful tests, a Docker image is built.
6. The image is published to Docker Hub with the `latest` tag.

Pull requests targeting `main` run the automated test job.

## Docker Image

**Docker Hub image:** [`sapnaahamed/cicd-pipeline-automation`](https://hub.docker.com/r/sapnaahamed/cicd-pipeline-automation)

Pull the image using:

```bash
docker pull sapnaahamed/cicd-pipeline-automation:latest
```

## Run Locally

Install the dependencies:

```bash
pip install -r requirements.txt
```

Start the application:

```bash
python app.py
```

Open `http://localhost:5000` in your browser.

## Run Automated Tests

```bash
python -m unittest -v
```

## Run with Docker

After installing Docker, run:

```bash
docker run -p 5000:5000 sapnaahamed/cicd-pipeline-automation:latest
```

Then open `http://localhost:5000`.

## Screenshots

Project evidence is available in the [`screenshots`](screenshots/) folder:

- `github-actions-pipeline

## Automated Docker Deployment

The `deploy.sh` script automates deployment of the latest Docker image from Docker Hub.

It:
1. Pulls the latest Docker image.
2. Removes the previous container if it exists.
3. Starts the container with automatic restart enabled.
4. Checks the `/health` endpoint.
5. Displays container logs and exits with an error if the health check fails.

Run the script in an environment with Docker, Bash, and curl installed:

```bash
bash deploy.sh
```

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

The application was tested in GitHub Codespaces. This is a temporary test environment, not a permanent public deployment.

## Project Links

- **GitHub repository:** https://github.com/sapnaahamed23-hub/cognevance_cicd-pipeline-automation
- **GitHub Actions:** https://github.com/sapnaahamed23-hub/cognevance_cicd-pipeline-automation/actions
- **Docker Hub image:** https://hub.docker.com/r/sapnaahamed/cicd-pipeline-automation
