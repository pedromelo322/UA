import kopf
from kubernetes import client

@kopf.on.create("example.com", "v1alpha1", "exampleresources")
def create_fn(spec, name, namespace, logger, **kwargs):
    logger.info(f"Creating deployment for {name}")

    # Create Kubernetes API client
    apps_api = client.AppsV1Api()

    # Define Deployment object
    deployment = client.V1Deployment(
        metadata=client.V1ObjectMeta(
            name=f"{name}-deployment",
            namespace=namespace,
            labels={"app": name}
        ),
        spec=client.V1DeploymentSpec(
            replicas=1,
            selector=client.V1LabelSelector(
                match_labels={"app": name}
            ),
            template=client.V1PodTemplateSpec(
                metadata=client.V1ObjectMeta(
                    labels={"app": name}
                ),
                spec=client.V1PodSpec(
                    containers=[
                        client.V1Container(
                            name="nginx",
                            image="nginx:latest",
                            ports=[client.V1ContainerPort(container_port=80)]
                        )
                    ]
                )
            )
        )
    )

    # Create Deployment
    apps_api.create_namespaced_deployment(
        namespace=namespace,
        body=deployment
    )

    logger.info("Deployment created successfully")

    return {"message": "Deployment created"} 