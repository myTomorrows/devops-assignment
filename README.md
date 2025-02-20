# DevOps Assignment

## Objective

The goal of this assignment is to evaluate your understanding of key infrastructure concepts. We aim to gauge how you approach problem-solving and implement solutions while considering modern technology constraints such as scalability, availability, security, resilience, and fault-tolerance. This assignment encourages you to implement solutions based on your preferred approach and provide justification for your choices.

## The Task

This repository contains a basic Python Flask application that returns a string at the "/" endpoint and a JSON response at the "/config" endpoint. The task is to containerize this application and deploy the resulting image to a Kubernetes cluster using Terraform (Infrastructure as Code). After deployment, both endpoints should be accessible via a browser or curl.

## Instructions

- Create all the code and README's related to this task, in a new repository in your personal version control account.
- Push all the code to the repository
- Share the repository with us

## The Requirements

- Containerize application. Push the image to a container registry of your choice.
- The values for the environment variable in the Python script can be random.
- The application must be deployed to a Kubernetes cluster using a Helm chart.
- The application should be exposed and accessible via a browser.
- Terraform must be used to manage the deployment to the Kubernetes cluster.
- The Terraform state can be stored locally.
- Avoid using hardcoded values in the Helm charts or Terraform code; instead, apply best practices such as using secrets, config maps, and variables wherever possible.
- The Kubernetes cluster can be hosted on any platform of your choice (Minikube, Kind, or any cloud provider).
- Please create a README.md:
    - Explaining how the code works, how to deploy the application and how to verify its successful deployment.
    - Explain the decisions made during the design and implementation of the solution.
    - Explain the networking strategy you would adopt to deploy production ready applications on AWS.
    - Describe how you would implement a solution to grant access to various AWS services to the deployed application.
    - Describe how would you automate deploying the solution across multiple environments using CI/CD.
    - Discuss any trade-offs considered when designing the solution.
    - Explain how scalability, availability, security, and fault tolerance are addressed in the solution.
    - Suggest any potential enhancements that could be made to improve the overall solution.

## Good to have

- The same Helm charts should be reusable to deploy across multiple environments, with different configurations for each.
- The Terraform code should be reusable and capable of being deployed to multiple environments, each with its own configuration.
- An open-source monitoring solution can be deployed, providing basic observability for the application.
- Adding a health check endpoint in the application, and using that in the deployments improving Availability.


## How To

### Docker Build & Push
docker build -t your-dockerhub-username/mt-app:latest .
docker push your-dockerhub-username/mt-app:latest
