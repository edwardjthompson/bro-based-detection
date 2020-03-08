# event mqtt_connect(c: connection, msg: time)
#     {
#         print "------------------------------connect-----------------------------------";
#         print c;
#     }

# event mqtt_subscribe(c: connection, msg_id: count, topics: vector of string, req_qos: vector of count)
#     {
#         print "-----------------------------subscribe-----------------------------------";
#         print c;
#     }

# event loq_mqtt(ts: time)
#     {
#         print "-----------------------------log-----------------------------------";
#     }

# event new_packet(c: connection, p: pkt_hdr)
#     {   
#         print "\n***********new packet*************";
#         # print c;
#         print "\n***********header*****************";
#         # print p;
#     }
global i = 1;
event packet_contents(c: connection, contents: string)
    {   
        print i, contents;
        if ((bytestring_to_count(contents[0]) & 0xf0) == 0x80) {
            print "This is a subscribe MQTT";
        }
        # print "\n***********content&d*****************", i;
        # i += 1;
        # local n = contents[0];
        # print m;
        # print to_string_literal(n);
        # local x = bytestring_to_count(n) & 0xff;
        # print x;
        # print 0x82 & 0xff;
        # print 0x82 & 0xf0;
        # print 0x82 & 0xff;
        # print 0x82 & 0xff;
        # if (mqtt_type == 8)
    }
