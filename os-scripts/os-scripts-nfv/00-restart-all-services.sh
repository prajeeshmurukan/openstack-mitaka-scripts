       #Restart Compute services:

         service openstack-nova-api restart
         service openstack-nova-cert restart
        service openstack-nova-consoleauth restart
         service openstack-nova-scheduler restart
         service openstack-nova-conductor restart
         service openstack-nova-novncproxy restart

        #Restart Networking services.

         service neutron-server restart
         service neutron-dhcp-agent restart
         service neutron-l3-agent restart
         service neutron-metadata-agent restart

        #Also restart your chosen Networking plug-in agent, for example, Open vSwitch.

        # service neutron-openvswitch-agent restart
    #Cinder Services restart

     service openstack-cinder-api restart
     service openstack-cinder-backup restart
     service openstack-cinder-scheduler restart
     service openstack-cinder-volume restart
#On ubuntu run
    #  service --status-all | grep nova
    #  service --status-all | grep neutron
