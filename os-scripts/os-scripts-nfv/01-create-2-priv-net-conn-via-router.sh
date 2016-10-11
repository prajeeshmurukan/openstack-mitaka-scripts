SUBNET_ID=30
neutron net-create priv-net-$SUBNET_ID
neutron subnet-create priv-net-$SUBNET_ID $SUBNET_ID.0.0.0/24 --name priv_subnet-$SUBNET_ID --enable_dhcp=True --allocation-pool start=$SUBNET_ID.0.0.5,end=$SUBNET_ID.0.0.25 --gateway=$SUBNET_ID.0.0.1
neutron net-list
#add first network to ext router - for outside connectivity
neutron router-interface-add private-ext-router priv_subnet-$SUBNET_ID
PRIV_NET=$(neutron net-list | grep priv-net-$SUBNET_ID | awk '{print $2;}')
nova boot --nic net-id=$PRIV_NET --image cirros --flavor m1.tiny cirros-inst-$SUBNET_ID
