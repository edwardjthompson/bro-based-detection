# export {
#     redef enum Notice::Type += {
#         Mqtt::Subscribe,
#     };
# }

event mqtt_connect(c: connection, msg: time)
    {
        print "------------------------------connect-----------------------------------";
        print c;
        # print msg;
        # print topics;
        # print requested_qos;
        # print query;
        # if ( |query| > 52 ) {
        #     print "TOO LONG";
        #     print |query|;
        #     print c$id$orig_h;
        # }
        # if ( |query| > 52 ) {
        #     NOTICE([$note=Mqtt::Subscribe,
        #     $msg=fmt("%s attempts to subscribe to all topics", c$id$orig_h, query)]);
        # }
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
        print "***********new packet*************";
        print c;
        print "***********header*****************";
        print p;
    }

event packet_contents(c: connection, contents: string)
    {   
        print "***********new packet*************";
        print c;
        print "***********content*****************";
        print contents;
    }
