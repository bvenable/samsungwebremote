export AWS_PROFILE=samsungctl-read
export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
IP=$(./samsungip)
if [ -z "${IP}" ]; then
	echo "can't get samsung ip"
	exit 1
fi
nohup ./listener ${IP} >> listener.log &
