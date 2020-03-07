export {
    redef enum Notice::Type += {
        Mqtt::Subscribe,
    };
}

event mqtt_subscribe(c: connection, msg_id: count, topics: string_vec, requested_qos: index_vec)
    {
        print "--------------------------------------------------------------------";
        print c;
        print msg_id;
        print topics;
        print requested_qos;
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