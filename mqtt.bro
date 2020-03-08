export {
    redef enum Notice::Type += {
        Mqtt::Subscribe,
    };
}

global i = 1;
event packet_contents(c: connection, contents: string)
    {   
        # print i, contents;
        i += 1;
        local total_length = |contents|;
        # print "total contents length", total_length;
        if (bytestring_to_count(contents[0]) == 0x82) {
            # print "This is a subscribe MQTT";
            local j = 0;
            for (x in contents) {
                # print j, x;
                j += 1;
            }
            local position = 1;
            while (position < total_length-2) {
                local length = contents[position];
                position += (bytestring_to_count(length) + 2);
                # print "pos",position;
                if (position == total_length + 1) {
                    # print "Perfect Length";
                } else if (position > total_length){
                    # print "invalid length";
                    return;
                }
            }
            position = 1;
            local sub_all = F;
            while (position < total_length-2) {
                local l = contents[position];
                position += (bytestring_to_count(l) + 2);
                # print "contents[pos-1]", contents[position-3], position-3;
                if (contents[position-3] == "#") {
                    NOTICE([$note=Mqtt::Subscribe,
                    $msg=fmt("%s attempts to subscribe to all topics.", c$id$orig_h)]);
                }
            }
        }
    }
