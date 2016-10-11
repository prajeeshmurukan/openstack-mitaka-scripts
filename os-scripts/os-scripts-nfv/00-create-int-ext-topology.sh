nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0

neutron net-create ext-net --router:external \
 --provider:physical_network provider --provider:network_type flat \
 --shared

  neutron subnet-create ext-net --name ext-subnet \
  --allocation-pool start=192.168.2.163,end=192.168.2.169 \
  --disable-dhcp --gateway 192.168.2.161 192.168.2.0/24

neutron net-create private-network-10
neutron subnet-create private-network-10 10.0.0.0/24 --name priv_subnet-10 --enable_dhcp=True --allocation-pool start=10.0.0.5,end=10.0.0.25 --gateway=10.0.0.1

neutron net-list
neutron net-update ext-net --router:external
neutron router-create private-ext-router
neutron router-interface-add private-ext-router priv_subnet-10
neutron router-gateway-set private-ext-router ext-net
nova list


nova boot --nic net-id=$(neutron net-list | grep private-network-10 | awk '{print $2}') --image cirros --flavor m1.tiny cirros-inst-10-01
nova boot --nic net-id=$(neutron net-list | grep private-network-10 | awk '{print $2}') --image cirros --flavor m1.tiny cirros-inst-10-02


neutron floatingip-create ext-net
nova floating-ip-create ext-net
nova floating-ip-list
nova add-floating-ip $(nova list | grep cirros-inst-10-01 | awk '{print $2}')  192.168.2.163 
nova list

