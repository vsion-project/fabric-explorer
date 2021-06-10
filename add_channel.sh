#!/bin/bash
# Crear un script bash o makefile, que acepte parámetros (CREATE, DESTROY y OUTPUT) con los siguientes pasos:
# Load the user defined parameters
while [[ $# > 0 ]]
do
        case "$1" in

                -a|-p)
                        valA="$2"
                        shift
                        ;;

                -b|-tf)
                        valB="$2"
                        shift
                        ;;

		-c|--valueC)
                        valC="$2"
                        shift
                        ;;
	

                --help|*)
                        echo "Usage:"
			echo "------"
                        echo "    --help: for Help "
			echo "
Example
./start -p CREATE -tf L	
			(Install Terraform on Linux and deploy Cluster)
				
./start -p CREATE -tf M
			(Install Terraform on MacOs and deploy Cluster) 



			"

			cat  README.md | more
                        exit 1
                        ;;
        esac
        shift
done


if [ $valA == "CREATE" ]  ; then
	if [ $valB == "L" ]  ; then
		echo "CREATE + TFLINUX"
		#   ~/challenge/scripts/tf_Linux 
	        echo "----------------Permit Access to your Google Platform---------------------"
        	   gcloud auth application-default login 
	     	echo "----------------Select a Project -----------------------------------------"
		   #gcloud projects list
		   #gcloud init 
		echo "----------------Enter Project---------------------------------------------"
		echo "----------------Select copy and Paste Project-----------------------------"
		read ValProject	
			
		echo "----------------Make variables.tf-----------------------------------------"
echo '		
variable "name" {
  default = "demo-cluster"
}
variable "project" {
  default = "'$ValProject'"
}
variable "location" {
  default = "us-central1"
}
variable "initial_node_count" {
  default = 1
}
variable "machine_type" {
  default = "n1-standard-1"
}' > ~/challenge/terraform-gke/variables.tf 
		
	
       	 	echo "----------------Deploy cluster--------------------------------------------"
		cd terraform-gke
		terraform init -reconfigure
        	terraform plan
        	terraform apply
		
		echo "-----------------gcloud --------------------------------------------------"
		gcloud container clusters list
		gcloud container clusters get-credentials demo-cluster --region us-central1 --project $ValProject
	

		echo "-----------------Verify kubectl-------------------------------------------"

		#./verify /usr/bin/kubectl 
		# verify kubectl 



		cd app-nginx 
	       	kubectl apply -f deployment.yaml
		kubectl apply -f service.yaml
		kubectl apply -f ingress.yaml
	

	elif
	[ $valB == "M" ]  ; then
		echo "CREATE + TFMAC"
		#   ~/challenge/scripts/tf_MacOS
                echo "----------------Permit Access to your Google Platform---------------------"
                   gcloud auth application-default login       
                echo "----------------Deploy cluster--------------------------------------------"
                   cd terraform-gke
		terraform init -reconfigure   
                terraform plan
                terraform apply
	fi

fi

if [ $valA == "DESTROY" ]  ; then
		echo "DESTROY"
		cd terraform-gke
		terraform destroy
fi
if [ $valA == "OUTPUT" ]  ; then
		echo "OUTPUT"


fi












#cd test-network
#./network.sh up createChannel -c criptochannel -s couchdb -i 2.2
