event mqtt_connect(c: connection, msg: time)
    {
        print "------------------------------connect-----------------------------------";
        print c;
    }

event mqtt_subscribe(c: connection, msg_id: count, topics: vector of string, req_qos: vector of count)
    {
        print "-----------------------------subscribe-----------------------------------";
        print c;
    }

event loq_mqtt(ts: time)
    {
        print "-----------------------------log-----------------------------------";
    }

event new_packet(c: connection, p: pkt_hdr)
    {   
        print "\n***********new packet*************";
        # print c;
        print "\n***********header*****************";
        # print p;
    }

event packet_contents(c: connection, contents: string)
    {   
        print "\n***********content*****************";
        print contents;
        print sub_bytes(contents, 3, 1);
    }
